require 'taglib'

module Refinery
  module Talks
    module Admin
      class TalksController < ::Refinery::AdminController
        after_action :write_id3_tags, only: [:create, :update]

        before_action :compilations, only: [:new, :create, :edit, :update]

        before_action :check_compilation_ids, :only => :update

        crudify :'refinery/talks/talk',
                :title_attribute => 'title'

        private

        def write_id3_tags
          mp3_file = Rails.root.join("public/system/refinery/resources/#{Refinery::Resource.find(talk_params[:file_id]).file_uid}").to_s

          TagLib::MPEG::File.open(mp3_file) do |file|
            tag = file.id3v2_tag

            # Write basic attributes
            tag.artist = Refinery::Talks::Teacher.find(talk_params[:teacher_id]).name
            tag.title = talk_params[:title]
            tag.album = "Volume #{talk_params['date(1i)'].to_s[2..3]}"
            tag.comment = ActionController::Base.helpers.strip_tags(talk_params[:description])
            tag.genre = "Other"

            file.save
          end
        end

        def talk_params
           params.require(:talk).permit(
              :title, :description, :teacher_id, :talk_length, :date, :file_id, :compilation_ids => [])
        end

        def compilations
          @compilations = Refinery::Talks::Compilation.all
        end

        def check_compilation_ids
          talk_params[:compilation_ids] ||= []
        end
      end
    end
  end
end
