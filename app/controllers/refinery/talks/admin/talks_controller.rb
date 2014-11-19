module Refinery
  module Talks
    module Admin
      class TalksController < ::Refinery::AdminController

        crudify :'refinery/talks/talk',
                :title_attribute => 'title'

        private

        def talk_params
           params.require(:talk).permit(
              :title, :description, :teacher_id, :date, :file_id)
        end
      end
    end
  end
end
