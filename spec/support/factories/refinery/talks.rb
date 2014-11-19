
FactoryGirl.define do
  factory :talk, :class => Refinery::Talks::Talk do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

