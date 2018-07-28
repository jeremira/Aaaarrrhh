require 'rails_helper'

RSpec.feature "Pirates", type: :feature do
  let(:pirate1) {create :pirate}
  let(:pirate2) {create :pirate}

  scenario "I can see all me pirates" do
    pirate1
    pirate2
    visit root_path
    expect(page).to have_content "AAAARRRHH ! Make me fight !"
    expect(page).to have_content pirate1.name
    expect(page).to have_content pirate2.name
  end

  scenario "I can create a new pirate" do
    visit root_path
    fill_in :name, with: "new_pirate"
    select 5, from: "hp"
    select 5, from: "dmg"
    click_button "Get me a new pirate !"
    expect(page).to have_content "A new pirate has been add t' th' crew !"
    expect(Pirate.find_by(name: "new_pirate")).to be_an Pirate
  end

  scenario "I can change me bloody pirate details" do
    pirate1
    visit root_path
    click_button "Change th' pirate !"
    fill_in :name, with: "edit_name"
    click_button "Save me pirate"
    expect(page).to have_content "Pirate's changes has been saved t' rthe registe"
    expect(page).to have_content "edit_name"
    expect(Pirate.find_by(name: "edit_pirate")).to be_an Pirate
  end

  scenario "I can scuttle me useless pirate" do
    create :pirate, name: "deleted_pirate"
    visit root_path
    click_button "Scuttle th' pirate !"
    expect(page).to have_content "Ahahahaha ! Ye did it ! We scuttle this useless brat !"
    expect(page).to_not have_content("deleted_pirate")
    expect(Pirate.find_by(name: "deleted_pirate")).to be nil
  end
end
