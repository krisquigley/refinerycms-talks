module Refinery
  module Talks
    module Admin
      class CompilationsController < ::Refinery::AdminController

        crudify :'refinery/talks/compilation',
                :title_attribute => 'title'

        private

        def compilation_params
           params.require(:compilation).permit(:title, :teacher_id)
        end
      end
    end
  end
end
