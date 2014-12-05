module Refinery
  module Talks
    class Systematization < Refinery::Core::BaseModel
      belongs_to :talk
      belongs_to :compilation
    end
  end
end
