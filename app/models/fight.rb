class Fight < ApplicationRecord
  belongs_to :pirate_a, :class_name => 'Pirate', :foreign_key => 'pirate_a_id'
  belongs_to :pirate_b, :class_name => 'Pirate', :foreign_key => 'pirate_b_id'

  has_many :steps

  def machine_learning_disruptive_blockchained_ia_fight_processor
    # score is [pirate_a, pirate_b] points
    score = first_blow
    score = main_struggle(score)
    score = last_hope(score)
    if score[0] > score[1]
      self.winner = 1
    else
      self.winner = 2
    end
  end

  def winner_name
    default = "Nobody win !Ye fork faced panty waist!"
    case self.winner
    when 2
      return self.pirate_b.name.capitalize rescue default
    when 1
      return self.pirate_a.name.capitalize rescue default
    else
      return default
    end
  end

  private

  def first_blow
    # Speed contest to get first strike
    # The less hp and dmg you got the fastest you go
    a_inertie = self.pirate_a.hp * self.pirate_a.dmg
    b_inertie = self.pirate_b.hp * self.pirate_b.dmg
    a = 150 - rand(0..a_inertie) + b_inertie/3
    b = 150 - rand(0..b_inertie) - a_inertie/3
    [a, b]
  end

  def main_struggle(score)
    # Hp/dmg contest
    a, b = score
    a_dmg = self.pirate_a.dmg * 10 + (100 - self.pirate_b.hp * 10)
    b_dmg = self.pirate_b.dmg * 10 + (100 - self.pirate_a.hp * 10)
    a += rand(0..a_dmg)
    b += rand(0..b_dmg)
    [a, b]
  end

  def last_hope(score)
    # Endurance end of game
    a, b = score
    a += rand(0..self.pirate_a.hp * 10)
    b += rand(0..self.pirate_b.hp * 10)
    [a, b]
  end

end
