module Refinery
  module Talks
    module Admin
      class TeachersController < ::Refinery::AdminController

        crudify :'refinery/talks/teacher',
                :title_attribute => 'name'

        private

        def teacher_params
           params.require(:teacher).permit(:name, :guest)
        end
      end
    end
  end
end
