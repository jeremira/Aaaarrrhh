require 'rails_helper'

RSpec.feature "Pirates", type: :feature do
  let(:pirate1) {create :pirate}
  let(:pirate2) {create :pirate}

  scenario "I see all me pirates" do
    pirate1
    pirate2
    visit root_path
    expect(page).to have_content "AAAARRRHH ! Make me fight !"
    expect(page).to have_content pirate1.name
    expect(page).to have_content pirate2.name
  end

  describe "I create a new pirate" do
    before(:each) {visit root_path}

    context "wit' valid name" do
      before :each do
        fill_in :pirate_name, with: "new_pirate"
        click_button "Get me a new pirate !"
      end
      it "save a new pirate" do
        expect(Pirate.find_by(name: "new_pirate")).to be_an Pirate
      end
      it "display a flash message" do
        expect(page).to have_content "A new pirate has been add t' th' crew !"
      end
    end
    context "wit' no name" do
      it "do nah save a new pirate" do
        click_button "Get me a new pirate !"
        expect(Pirate.count).to eq 0
      end
    end
    context "wit' a duplicate name" do
      before :each do
        pirate1
        fill_in :pirate_name, with: pirate1.name
        click_button "Get me a new pirate !"
      end
      it "do nah save a new pirate" do
        expect(Pirate.find_by(name: "new_pirate")).to be nil
      end
      it "display a flash message" do
        expect(page).to have_content "Bloody Davy Jones' locker. 'tis wrong !"
      end
    end
  end

  describe "I edit pirate details" do
    before(:each) do
      pirate1
      visit root_path
      click_link "Change th' pirate !"
    end

    context "wit' valid params" do
      before :each do
        fill_in :pirate_name, with: "edit_pirate"
        click_button "Save me pirate"
      end
      it "edit pirate details" do
        pirate1.reload
        expect(pirate1.name).to eq "edit_pirate"
      end
      it "display a flash message" do
        expect(page).to have_content "Pirate's changes has been saved t' rthe registe"
      end
    end

    context "wit' nah name" do
      before :each do
        fill_in :pirate_name, with: ""
        click_button "Save me pirate"
      end
      it "do nah update pirate details" do
        pirate1.reload
        expect(pirate1.name).to_not be ""
      end
    end

    context "wit' a duplicate name" do
      before :each do
        fill_in :pirate_name, with: pirate2.name
        click_button "Save me pirate"
      end
      it "do nah update pirate details" do
        pirate1.reload
        expect(pirate1.name).to_not be pirate2.name
      end
      it "display a flash message" do
        expect(page).to have_content "Bloody Davy Jones' locker. 'tis wrong !"
      end
    end
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
