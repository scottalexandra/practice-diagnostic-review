require 'rails_helper'

describe "user can search for nearest station" do
  scenario "by location" do
    # As a user
    # When I visit "/"
    visit root_path
    # And I select "Turing" form the start location drop down (Note: Use the existing search form)
    select "Turing", from: :location
    # And I click "Find Nearest Station"
    click_button "Find Nearest Station"
    # Then I should be on page "/search"
    expect(current_path).to eq(search_path)
    # Then I should see the closest electric fuel station to me.
    #
    # For that station I should see
    # - Name
    # - Address
    # - Fuel Type
    # - Access Times

    # I should also see:
    # - the distance of the nearest station (should be 0.1 miles)
    # - the travel time from Turing to that fuel station (should be 1 min)
    # - The direction instructions to get to that fuel station
    #   "Turn left onto Lawrence St Destination will be on the left"
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
