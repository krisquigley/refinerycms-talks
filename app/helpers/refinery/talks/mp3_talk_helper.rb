module Refinery
  module Talks
    module Mp3TalkHelper
      def show_mp3s(talk)
        File.extname(talk.file.file_uid).downcase == '.mp3'
      end
    end
  end
end