class Pirate < ApplicationRecord

  validates :name, :hp, :dmg, presence: true
  validates :name, uniqueness: true

  has_many :a_fights, class_name: "Fight", foreign_key: "pirate_a_id", dependent: :destroy
  has_many :b_fights, class_name: "Fight", foreign_key: "pirate_b_id", dependent: :destroy

  def fights
    self.a_fights + self.b_fights
  end
end
