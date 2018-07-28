require 'rails_helper'

RSpec.describe Pirate, type: :model do
  let(:pirate) {create :pirate}

  it "has a valid factory" do
    expect(pirate).to be_valid
  end
  it "has a unic name" do
    other_pirate = build :pirate, name: pirate.name
    expect(other_pirate).to_not be_valid
  end
  it "require a name" do
    pirate.name = nil
    expect(pirate).to_not be_valid
  end
  it "require hp stats" do
    pirate.hp = nil
    expect(pirate).to_not be_valid
  end
  it "require dmg stats" do
    pirate.dmg = nil
    expect(pirate).to_not be_valid
  end
  it "returns all his fights" do
    f1 = create :fight, pirate_a: pirate
    f2 = create :fight, pirate_b: pirate
    expect(pirate.fights).to eq [f1, f2]
  end
end
