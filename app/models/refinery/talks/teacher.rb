require 'globalize'

module Refinery
  module Talks
    class Teacher < Refinery::Core::BaseModel
      extend FriendlyId

      self.table_name = 'refinery_talks_teachers'

      validates :name, presence: true, uniqueness: true

      has_many :talks, dependent: :destroy
      has_many :compilations, dependent: :destroy

      friendly_id :name, :use => [:slugged, :globalize]
    end
  end
end
