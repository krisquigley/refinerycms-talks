require 'taglib'
module Refinery
  module Talks
    class WriteId3TagsJob
      include Sidekiq::Worker

      def perform(file_id, options)
        mp3_file = Rails.root.join("public/system/refinery/resources/#{Refinery::Resource.find(file_id).file_uid}").to_s

        if File.extname(mp3_file) == '.mp3'

          TagLib::MPEG::File.open(mp3_file) do |file|
            tag = file.id3v2_tag

            teacher = Refinery::Talks::Teacher.find(options['teacher'])

            # Write basic attributes
            tag.artist = teacher.name
            tag.title = options['title']
            tag.album = "Volume #{options['date']}"
            tag.comment = ActionController::Base.helpers.strip_tags(options['description'])
            tag.genre = "Other"

            file.save
          end
        end
      end
    end
  end
end
