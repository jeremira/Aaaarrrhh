FactoryBot.define do
  factory :step do
    sequence :content { |n| "step_#{n}"}
    fight
  end
end
