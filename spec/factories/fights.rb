FactoryBot.define do
  factory :fight do
    association :pirate_a, factory: :pirate
    association :pirate_b, factory: :pirate
  end
end
