require 'rails_helper'

RSpec.describe Fight, type: :model do
  let(:fight) {create :fight}

  it "has a valid factory" do
    expect(fight).to be valid
  end

  it "has a default winner value 0" do
    expect(Fight.new.winner).to eq 0
  end

  it "has 2 ready player" do
    expect(fight.pirate_a).to be_an Pirate
    expect(fight.pirate_b).to be_an Pirate
  end

end
