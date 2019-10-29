require 'rails_helper'

describe "user can search for nearest station" do
  scenario "by location" do
    visit root_path
    select "Turing", from: :location
    click_button "Find Nearest Station"

    expect(current_path).to eq(search_path)
    within(".station_container") do
      expect(page).to have_css(".name")
      expect(page).to have_css(".address")
      expect(page).to have_css(".fuel_type")
      expect(page).to have_css(".access_times")
      expect(page).to have_css(".distance")
      expect(page).to have_css(".travel_time")
      expect(page).to have_css(".instructions")
    end
  end
end
