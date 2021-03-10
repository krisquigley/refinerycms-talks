module Refinery
  module Talks
    class TalksController < ::ApplicationController
      include FileExtensionHelper

      before_action :find_all_talks
      before_action :find_all_teachers, only: :index
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @talk in the line below:
      end

      def show
        @talk = Talk.friendly.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @talk in the line below:

        respond_to do |format|
          format.html { present(@page) }
          format.mp3 { redirect_to @talk.file.url }
        end
      end

      def download
        @talk = Talk.friendly.find(params[:talk_id])

        send_data absolute_url(@talk), filename: "#{@talk.file.file_name.gsub(/\W+/,'-')}.mp3", type: "audio/mp3"
      end

    protected

      def find_all_talks
        @talks = Talk.order('date DESC').joins(:file).where('file_uid ~* ?', '.mp3').paginate :page => params[:page],
        :per_page => 10
      end

      def find_all_teachers
        @teachers = Teacher.friendly.where(guest: false).order('position ASC')
        @guest_teachers = Teacher.friendly.where(guest: true).order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/teachings/talks").first
      end

    end
  end
end
