FactoryBot.define do
  factory :step do
    sequence :content { |n| "step_#{n}"}
  end
end
