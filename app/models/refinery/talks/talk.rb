require 'acts_as_indexed'
require 'globalize'

module Refinery
  module Talks
    class Talk < Refinery::Core::BaseModel
      extend FriendlyId

      self.table_name = 'refinery_talks'

      validates :date, :description, :teacher_id, :talk_length, presence: true
      validates :title, presence: true, uniqueness: true

      belongs_to :file, class_name: '::Refinery::Resource'
      belongs_to :teacher
      has_many :systematizations
      has_many :compilations, through: :systematizations

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed fields: [:title, :description]

      friendly_id :title, :use => [:slugged, :globalize]
    end
  end
end
