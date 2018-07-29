require 'rails_helper'

RSpec.describe Fight, type: :model do
  let(:fight) {create :fight}

  it "has a valid factory" do
    expect(fight).to be_valid
  end

  it "has a default winner value 0" do
    expect(Fight.new.winner).to eq 0
  end

  it "has 2 ready t'fight pirates" do
    expect(fight.pirate_a).to be_an Pirate
    expect(fight.pirate_b).to be_an Pirate
  end

  describe "#winner_name" do
    context "undefined winned" do
      it "return default value" do
        expect(fight.winner_name).to eq "Nobody win !Ye fork faced panty waist!"
      end
    end
    context "player A won" do
      it "return player A name" do
        fight.winner = 1
        expect(fight.winner_name).to eq fight.pirate_a.name
      end
    end
    context "player B won" do
      it "return player B name" do
        fight.winner = 2
        expect(fight.winner_name).to eq fight.pirate_b.name
      end
    end
  end

  describe "#machine_learning_disruptive_blockained_ia_fight_processor" do
    before(:each) {fight.machine_learning_disruptive_blockchained_ia_fight_processor}
    it "setup a pirate as a winner" do
      expect(fight.winner).to_not eq 0
    end
    it "create some steps" do
      expect(fight.steps.size).to_not be_empty
    end
  end

end
