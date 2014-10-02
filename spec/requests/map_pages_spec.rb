
# jr@oblique: 1/10/14


require 'spec_helper'


describe "Map pages" do

  subject { page }



# INDEX 
  describe "Index" do
    
    #let(:map) { FactoryGirl.create(:map) }
    before(:all) { 1.times { FactoryGirl.create(:map) } }
    after(:all)  { Map.delete_all }

    before do
      visit maps_path
    end

    describe "Content and title" do
      it { should have_title('Index of Maps') }
      it { should have_content('Index of Maps') }
    end

    # delete links 
    describe "Delete links" do
        it { should have_link('Delete', href: map_path(Map.first)) }
        it "should be able to delete a map" do
          expect do
            click_link('Delete', match: :first)
          end.to change(Map, :count).by(-1)
        end
    end

  end




# CREATE 
  describe "Creating Maps" do

    before { visit new_map_path }
    let(:submit) { "Create map" }

    #let(:point) { FactoryGirl.create(:point) }


  # invalid info
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Point, :count)
      end
    end



  # valid info
    describe "with valid information" do

      # Create Restaurant samples in the database      
      before(:all) { 10.times { FactoryGirl.create(:restaurant) } }
      after(:all)  { Restaurant.delete_all }

      # Restaurants 
      describe "Restaurants" do
        before do
          fill_in "Name", with: "Restaurants"
          uncheck   'map_map_type_all'
          check   'map_map_type_res'
          uncheck 'map_map_type_med'
          uncheck 'map_map_type_mar'
          uncheck 'map_map_type_yog'
          uncheck 'map_map_type_eve'
        end
        it "should create a point" do
          expect { click_button submit }.to change(Map, :count).by(1)
        end
      end

      # Meditation 
      describe "Meditation" do 
        before do
          fill_in "Name", with: "Meditation"
          uncheck   'map_map_type_all'
          uncheck   'map_map_type_res'
          check 'map_map_type_med'
          uncheck 'map_map_type_mar'
          uncheck 'map_map_type_yog'
          uncheck 'map_map_type_eve'
        end
        it "should create a point" do
          expect { click_button submit }.to change(Map, :count).by(1)
        end
      end

      # Markets 
      describe "Markets" do
        before do
          fill_in "Name", with: "Markets"
          uncheck   'map_map_type_all'
          uncheck   'map_map_type_res'
          uncheck 'map_map_type_med'
          check 'map_map_type_mar'
          uncheck 'map_map_type_yog'
          uncheck 'map_map_type_eve'
        end
        it "should create a point" do
          expect { click_button submit }.to change(Map, :count).by(1)
        end
      end

      # Yoga 
      describe "Yoga" do 
        before do
          fill_in "Name", with: "Yoga"
          uncheck   'map_map_type_all'
          uncheck   'map_map_type_res'
          uncheck 'map_map_type_med'
          uncheck 'map_map_type_mar'
          check 'map_map_type_yog'
          uncheck 'map_map_type_eve'
        end
        it "should create a point" do
          expect { click_button submit }.to change(Map, :count).by(1)
        end
      end

      # Events
      describe "Events" do 
        before do
          fill_in "Name", with: "Events"
          uncheck   'map_map_type_all'
          uncheck   'map_map_type_res'
          uncheck 'map_map_type_med'
          uncheck 'map_map_type_mar'
          uncheck 'map_map_type_yog'
          check 'map_map_type_eve'
        end
        it "should create a point" do
          expect { click_button submit }.to change(Map, :count).by(1)
        end
      end

      # All
      describe "All" do 
        before do
          fill_in "Name", with: "All"
          check     'map_map_type_all'
          uncheck   'map_map_type_res'
          uncheck   'map_map_type_med'
          uncheck   'map_map_type_mar'
          uncheck   'map_map_type_yog'
          uncheck   'map_map_type_eve'
        end
        it "should create a point" do
          expect { click_button submit }.to change(Map, :count).by(1)
        end
      end 
    end
  end





# SHOW - Profile page 
  describe "Show" do

    #let(:user) { FactoryGirl.create(:user) }
#    let(:map) { FactoryGirl.create(:map) }

    #let!(:m1) { FactoryGirl.create(:micropost, user: user, content: "Foo") }
    #let!(:m2) { FactoryGirl.create(:micropost, user: user, content: "Bar") }

#    let!(:m1) { FactoryGirl.create(:point, map: map,  name: "Foo", 
#                                                      point_type: "restaurant", info: "some info", 
#                                                      lat_dec: "-5.0", lng_dec: "-55.0",
#                                                      created_by: "javier", last_updated_by: "javier"
#                                                      )}
#    let!(:m2) { FactoryGirl.create(:point, map: map, name: "Bar",
#                                                      point_type: "restaurant", info: "some info", 
#                                                      lat_dec: "-5.0", lng_dec: "-55.0",
#                                                      created_by: "javier", last_updated_by: "javier")}


    #before { visit user_path(user) }
#    before { visit map_path(map) }

    #it { should have_content(user.name) }
    #it { should have_title(user.name) }
#    it { should have_content(map.name) }
#    it { should have_title(map.name) }


    #describe "microposts" do
#    describe "points" do
      #it { should have_content(m1.content) }
      #it { should have_content(m2.content) }
      #it { should have_content(user.microposts.count) }
#      it { should have_content(m1.name) }
#      it { should have_content(m2.name) }
#      it { should have_content(map.points.count) }
#    end
  end






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