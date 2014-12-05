require 'globalize'

module Refinery
  module Talks
    class Compilation < Refinery::Core::BaseModel
      extend FriendlyId

      self.table_name = 'refinery_talks_compilations'

      validates :title, presence: true, uniqueness: true

      has_many :systematizations
      has_many :talks, through: :systematizations
      belongs_to :teacher

      friendly_id :title, :use => [:slugged, :globalize]
    end
  end
end
