class Pirate < ApplicationRecord

  validates :name, :hp, :dmg, presence: true
  validates :name, uniqueness: true
end
