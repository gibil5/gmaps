
# jr@oblique: 10/9/14

require 'spec_helper'

describe "Restaurant pages" do

  subject { page }


# INDEX 
  describe "index" do
    
    let(:restaurant) { FactoryGirl.create(:restaurant) }
    
    #before(:each) do
    before do
      #sign_in user
      visit restaurants_path
    end

    it { should have_title('All restaurants') }
    it { should have_content('All restaurants') }



  # pagination 
    describe "pagination" do

      #before(:all) { 30.times { FactoryGirl.create(:restaurant) } }
      before(:all) { 10.times { FactoryGirl.create(:restaurant) } }
      after(:all)  { Restaurant.delete_all }

      #it { should have_selector('div.pagination') }

      it "should list each restaurant" do
        Restaurant.paginate(page: 1).each do |restaurant|
          expect(page).to have_selector('li', text: restaurant.name)
        end
      end
    end
  end






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



# EDIT -  user pages 
  describe "edit" do

    let(:restaurant) { FactoryGirl.create(:restaurant) }

    before do
      #sign_in user
      visit edit_restaurant_path(restaurant)
    end
    
    describe "page" do
      it { should have_content("Update your data") }
      it { should have_title("Edit restaurant") }
      #it { should have_link('change', href: 'http://gravatar.com/emails') }
    end

# with invalid information 
    #describe "with invalid information" do
    #  before { click_button "Save changes" }
    #  it { should have_content('error') }
    #end


# with valid information 
    describe "with valid information" do

      let(:new_name)  { "New Name" }
      let(:new_info) { "new info" }

      before do
        fill_in "Name",             with: new_name
        fill_in "Info",             with: new_info
        click_button "Save changes"
      end

      it { should have_title(new_name) }
    #  it { should have_selector('div.alert.alert-success') }
    #  it { should have_link('Sign out', href: signout_path) }
    #  specify { expect(user.reload.name).to  eq new_name }
    #  specify { expect(user.reload.email).to eq new_email }
    end
  end



end