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
          WriteId3TagsJob.perform_async(talk_params[:file_id], {'teacher' => talk_params[:teacher_id],
                                                                'title' => talk_params[:title],
                                                                'description' => talk_params[:description],
                                                                'date' => talk_params['date(1i)'].to_s[2..3]})
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
