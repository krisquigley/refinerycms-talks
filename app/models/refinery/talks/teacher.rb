module Refinery
  module Talks
    class Teacher < Refinery::Core::BaseModel
      self.table_name = 'refinery_talks_teachers'

      validates :name, presence: true, uniqueness: true

      has_many :talks

    end
  end
end
