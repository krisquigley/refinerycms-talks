require 'taglib'

module Refinery
  module Talks
    module Admin
      class TalksController < ::Refinery::AdminController
        after_action :write_id3_tags, only: [:create, :update]

        crudify :'refinery/talks/talk',
                :title_attribute => 'title'

        private

        def write_id3_tags
          Rails.logger.debug talk_params[:date]

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
              :title, :description, :teacher_id, :date, :file_id)
        end
      end
    end
  end
end
