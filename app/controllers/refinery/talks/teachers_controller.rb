module Refinery
  module Talks
    class TeachersController < ::ApplicationController

      before_action :find_page

      def show
        @teacher = Teacher.friendly.find(params[:id])
        @talks = Talk.where(teacher_id: @teacher.id).order('date DESC').paginate :page => params[:page],
        :per_page => 5
        @compilations = @teacher.compilations.order('title ASC')
      end

      protected

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/teachings/talks").first
      end
    end
  end
end
