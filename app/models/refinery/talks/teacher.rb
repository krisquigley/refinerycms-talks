require 'globalize'

module Refinery
  module Talks
    class Teacher < Refinery::Core::BaseModel
      extend FriendlyId

      self.table_name = 'refinery_talks_teachers'

      validates :name, presence: true, uniqueness: true

      has_many :talks
      has_many :compilations

      friendly_id :name, :use => [:slugged, :globalize]
    end
  end
end
