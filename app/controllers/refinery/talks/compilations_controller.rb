module Refinery
  module Talks
    class CompilationsController < ::ApplicationController

      before_action :find_page

      def show
        @compilation = Compilation.friendly.find(params[:id])
        @talks = @compilation.talks.order('date DESC').paginate :page => params[:page],
        :per_page => 10
      end

      protected

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/teachings/talks").first
      end
    end
  end
end
