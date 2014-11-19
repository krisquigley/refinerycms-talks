module Refinery
  module Talks
    class TalksController < ::ApplicationController

      before_action :find_all_talks
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @talk in the line below:
        present(@page)
      end

      def show
        @talk = Talk.friendly.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @talk in the line below:
        present(@page)
      end

    protected

      def find_all_talks
        @talks = Talk.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/teachings/talks").first
      end

    end
  end
end
