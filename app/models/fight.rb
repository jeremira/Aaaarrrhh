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
      insert_step("#{self.pirate_a.name} throw #{self.pirate_b.name} in th' sea :")
      insert_step("Time to cut ye' up for shark food ye pee soaked son of a punk alley harlot!")
      self.winner = 1
    else
      insert_step("#{self.pirate_b.name} cut #{self.pirate_b.name} both hand with a spoon :")
      insert_step("Lemme spell out the rules for ye. I win. YOU LOSE! ye chimp faced rotatin' snot rag !")
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
    insert_step("Go slam yer head on a marlin spike ye pigs faced butt scratchin' scurvy baboon !Fight I told ye all !!!")
    # Speed contest to get first strike
    # The less hp and dmg you got the fastest you go
    a_inertie = self.pirate_a.hp * 2 + self.pirate_a.dmg + 1
    b_inertie = self.pirate_b.hp * 2 + self.pirate_b.dmg + 1
    if a_inertie > b_inertie
      insert_step("Ohoh, #{self.pirate_a.name} be a fat slow crap sack !")
    else
      insert_step("Ohoh, #{self.pirate_b.name} be a fat slow crap sack !")
    end
    a = (rand(0..b_inertie)*6) / rand(1..a_inertie)
    b = (rand(0..a_inertie)*6) / rand(1..b_inertie)
    if a > b
      insert_step("Wooosh ! #{self.pirate_a.name} got th' first blood !")
      insert_step("'n thats a farrgin' critical hit !") if a > b*2
    else
      insert_step("Wooosh ! #{self.pirate_b.name} got th' first blood !")
      insert_step("'n thats a farrgin' critical hit !") if b > a*2
    end
    [a, b]
  end

  def main_struggle(score)
    # Hp/dmg contest
    insert_step("#{self.pirate_a.name} and #{self.pirate_b.name} are strugglin in close combat !")
    a, b = score
    a_dmg = self.pirate_a.dmg * 10 + (100 - self.pirate_b.hp * 10)
    insert_step("#{self.pirate_a.name} be a mastoc !") if a_dmg > 150
    b_dmg = self.pirate_b.dmg * 10 + (100 - self.pirate_a.hp * 10)
    insert_step("#{self.pirate_b.name} be a mastoc !") if a_dmg > 150
    a += rand(0..a_dmg)
    b += rand(0..b_dmg)
    if a > b
      insert_step("#{self.pirate_a.name} tears out #{self.pirate_b.name}'s left arm wit' his teeth !")
      insert_step("'n hit his opponent wit' a rum jar !") if a > b*2
    else
      insert_step("#{self.pirate_b.name} tears out #{self.pirate_a.name}'s left arm wit' his teeth !")
      insert_step("'n hit his opponent wit' a rum jar !") if a > b*2
    end
    [a, b]
  end

  def last_hope(score)
    # Endurance end of game
    a, b = score
    a += rand(0..self.pirate_a.hp * 10)
    insert_step("My grandma has more stamina that ye lard brained #{self.pirate_a.name} !") if a < 30
    b += rand(0..self.pirate_b.hp * 10)
    insert_step("My grandma has more stamina that ye lard brained #{self.pirate_b.name} !") if a < 30
    if a > b
      insert_step("#{self.pirate_a.name} dominate th' fight !")
    else
      insert_step("#{self.pirate_b.name} dominate th' fight !")
    end
    [a, b]
  end

  def insert_step(content)
    self.steps << Step.new(content: content)
  end

end
