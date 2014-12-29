module Refinery
  module Talks
    class CompilationsController < ::ApplicationController

      before_action :find_page

      def show
        @compilation = Compilation.friendly.find(params[:id])
        @talks = @compilation.talks.order('date ASC').paginate :page => params[:page],
        :per_page => 10
        @compilation.talks.each do |talk|
          if File.extname(talk.file.file_uid).downcase == '.zip'
            @zip = talk
          end
        end
      end

      protected

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/teachings/talks").first
      end
    end
  end
end
