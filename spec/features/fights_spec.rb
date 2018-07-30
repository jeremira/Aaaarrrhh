require 'rails_helper'

RSpec.feature "Fights", type: :feature do
  let(:pirate1) {create :pirate}
  let(:pirate2) {create :pirate}

  scenario "Two o' me crew scum fight t' death" do
    pirate1
    pirate2
    visit root_path
    select pirate1.name, from: :fight_pirate_a_id
    select pirate2.name, from: :fight_pirate_b_id
    click_button "Fight ! Ye syphilitic puppy killin' slimey bastitch !"
    expect(page).to have_content "WINNAH"
    expect(page).to have_content "LOOSA"
    expect(Fight.count).to eq 1
  end

end
