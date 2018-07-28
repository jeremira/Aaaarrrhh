require 'rails_helper'

RSpec.describe Step, type: :model do
  let(:step) {create :step}
  it "has a valid factory" do
    expect(step).to be_valid
  end
end
