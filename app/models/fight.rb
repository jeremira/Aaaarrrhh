class Fight < ApplicationRecord
  belongs_to :pirate_a, :class_name => 'Pirate', :foreign_key => 'pirate_a_id'
  belongs_to :pirate_b, :class_name => 'Pirate', :foreign_key => 'pirate_b_id'

  has_many :steps

  def machine_learning_disruptive_blockained_ia_fight_processor
    #include other buzz word
    self.winner = 1
    self.steps << Step.new(content: "Boubah baka")
  end
end
