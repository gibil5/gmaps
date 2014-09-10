
# jr@oblique: 10/9/14

require 'spec_helper'


describe "Restaurant pages" do

  subject { page }


# Signup page specification 
  describe "new restaurant page" do
  	
    #before { visit restaurants_new_path }
    before { visit new_restaurant_path }
      it { should have_content('New restaurant') }
      #it { should have_title(full_title('New restaurant')) }
  end


# Test signup process, with Capybara 
  describe "signup" do
    #before { visit restaurants_new_path }
    before { visit new_restaurant_path }
    let(:submit) { "Create restaurant" }


    # valid info, with capybara 
    describe "with valid information" do

      before do
        fill_in "Name",           with: "Raw Cafe"
        fill_in "Info",           with: "Crudivegano"
        fill_in "Lat decimal",    with: "11"
        fill_in "Long decimal",   with: "21"
      end

      it "should create a restaurant" do
        expect { click_button submit }.to change(Restaurant, :count).by(1)
      end
    end
  end



# Profile page 
  describe "profile page" do

    let(:restaurant) { 
        FactoryGirl.create(:restaurant) 
    }

    before { 
      # From capybara 
      #visit user_path(user) 
      visit restaurant_path(restaurant) 
    }

    it { should have_content(restaurant.name) }
    it { should have_title(restaurant.name) }
  end


end