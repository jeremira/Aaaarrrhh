FactoryBot.define do
  factory :pirate do
    sequence :name { |n| "pirate_#{n}" }
    hp 10
    dmg 10
  end
end
