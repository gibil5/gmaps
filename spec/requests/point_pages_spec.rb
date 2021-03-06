
# jr@oblique: 16/9/14


require 'spec_helper'


describe "Point pages" do

  subject { page }


# INDEX 
  describe "index" do
    
    let(:point) { FactoryGirl.create(:point) }
    
    before do
    #  sign_in user
      visit points_path
    end

    it { should have_title('All points') }
    it { should have_content('All points') }



# pagination 
#    describe "pagination" do

#      before(:all) { 30.times { FactoryGirl.create(:user) } }
#      after(:all)  { User.delete_all }

#      it { should have_selector('div.pagination') }

#      it "should list each user" do
#        User.paginate(page: 1).each do |user|
#          expect(page).to have_selector('li', text: user.name)
#        end
#      end
#    end


# delete links 
#    describe "delete links" do

#      it { should_not have_link('delete') }

#      describe "as an admin user" do
#        let(:admin) { FactoryGirl.create(:admin) }
#        before do
#          sign_in admin
#          visit users_path
#        end

#        it { should have_link('delete', href: user_path(User.first)) }
#        it "should be able to delete another user" do
#          expect do
#            click_link('delete', match: :first)
#          end.to change(User, :count).by(-1)
#        end
#        it { should_not have_link('delete', href: user_path(admin)) }
#      end
#    end
  end




# CREATE - Signup page specification 
#  describe "signup page" do
#    before { visit signup_path }
#      it { should have_content('Sign up') }
#      it { should have_title(full_title('Sign up')) }
#  end




# CREATE - Test signup process, with Capybara 
  describe "Creating points" do

    before { visit new_point_path }
    let(:submit) { "Create point" }


# invalid info
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Point, :count)
      end
    end



# POINT - valid info
    # with capybara 
    describe "with valid information" do
      before do

        fill_in "Name",           with: "Raw cafe"
        
        fill_in "Type",           with: "restaurant"
        fill_in "Subtype",           with: "restaurant"

        fill_in "Info",           with: "no info"
        fill_in "Lat decimal",    with: "-12.34"
        fill_in "Long decimal",   with: "-77.89"
        fill_in "Created by",     with: "Justi"
        fill_in "Last updated by",   with: "Javier"


        #fill_in "",   with: ""
        fill_in "Number",         with: "5"
        fill_in "Street",         with: "Sta Marta"
        fill_in "District",       with: "Miraflores"
        fill_in "Phone 1",        with: "3452329"
        fill_in "Phone 2",        with: "1234567"
        fill_in "Reference",      with: "No reference"

        fill_in "Open hours",     with: "6 to 8"

        fill_in "Email",          with: "name@gmail.com"
        fill_in "www",            with: "www.rawcafe.com"
        fill_in "Facebook",       with: "facebook/rawcafe"
        fill_in "Twitter",        with: "twitter/rawcafe"
        
        fill_in "Comments",       with: "No comments"
        #fill_in "",   with: ""

      end

      it "should create a point" do
        expect { click_button submit }.to change(Point, :count).by(1)
      end


      # Sign in the user after sign up 
#      describe "after saving the user" do
#        before { click_button submit }
#        let(:user) { User.find_by(email: 'user@example.com') }

#        it { should have_link('Sign out') }
#        it { should have_title(user.name) }
        #it { should have_selector('div.alert.alert-success', text: 'Welcome') }
#        it { should have_selector('div.alert.alert-success', text: 'Bienvenid@') }
#      end

    end
  end



# SHOW - Profile page 
#  describe "profile page" do

#    let(:user) { 
#    		FactoryGirl.create(:user) 
#    }

#    before { 
  		# From capybara 
#    	visit user_path(user) 
#    }

#    it { should have_content(user.name) }
#    it { should have_title(user.name) }
#  end



# EDIT - User pages 
#  describe "edit" do

#    let(:user) { FactoryGirl.create(:user) }

#    before do
#      sign_in user
#      visit edit_user_path(user)
#    end
    
#    describe "page" do
#      it { should have_content("Update your profile") }
#      it { should have_title("Edit user") }
#      it { should have_link('change', href: 'http://gravatar.com/emails') }
#    end

# with invalid information 
#    describe "with invalid information" do
#      before { click_button "Save changes" }
#      it { should have_content('error') }
#    end


# with valid information 
#    describe "with valid information" do
#      let(:new_name)  { "New Name" }
#      let(:new_email) { "new@example.com" }
#      before do
#        fill_in "Name",             with: new_name
#        fill_in "Email",            with: new_email
#        fill_in "Password",         with: user.password
#        fill_in "Confirm Password", with: user.password
#        click_button "Save changes"
#      end

#      it { should have_title(new_name) }
#      it { should have_selector('div.alert.alert-success') }
#      it { should have_link('Sign out', href: signout_path) }
#      specify { expect(user.reload.name).to  eq new_name }
#      specify { expect(user.reload.email).to eq new_email }
#    end


#  end


end