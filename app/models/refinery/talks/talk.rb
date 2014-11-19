module Refinery
  module Talks
    class Talk < Refinery::Core::BaseModel
      self.table_name = 'refinery_talks'

      validates :date, :teacher_id, presence: true
      validates :title, :description, presence: true, uniqueness: true

      belongs_to :file, class_name: '::Refinery::Resource'
      belongs_to :teacher

      # To enable admin searching, add acts_as_indexed on searchable fields, for example:
      #
      acts_as_indexed fields: [:title, :description]

    end
  end
end
