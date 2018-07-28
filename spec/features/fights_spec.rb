require 'rails_helper'

RSpec.feature "Fights", type: :feature do
  let(:pirate1) {create :pirate}
  let(:pirate2) {create :pirate}

  scenario "Two o' me crew scum fight t' death" do
    pirate1
    pirate2
    visit root_path
    select pirate1.name, from: :pirate_a
    select pirate2.name, from: :pirate_b
    click_button "Fight ! Ye syphilitic puppy killin' slimey bastitch !"
    expect(page).to have_content "Ye chimp faced rotatin' snot rag of #{player1.name} win !"
    expect(Fight.count).to eq 1
  end

  scenario "I check all me crew's fight t' death" do
    create :fight, pirate_a: pirate1, pirate_b: pirate2, winner: 1
    create :fight, pirate_a: pirate1, pirate_b: pirate2, winner: 2
    visit root_path
    click_link "All previous fights"
    expect(page).to have_content "#{fight1.name} : #{pirate1.name} be a winnah."
    expect(page).to have_content "#{fight2.name} : #{pirate2.name} be a winnah."
  end

end
