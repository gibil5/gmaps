
# jr@oblique:  1/10/14


require 'spec_helper'

describe "Microcomment pages" do

  subject { page }

  #let(:user) { FactoryGirl.create(:user) }
  let(:map) { FactoryGirl.create(:map) }
  #before { sign_in user }



# CREATE
  describe "CREATE - Micropost" do

    before { visit map_path(map) }

    describe "with invalid information" do

      it "should not create a micropost" do
        expect { click_button "Post" }.not_to change(Microcomment, :count)
      end

      #describe "error messages" do
      #  before { click_button "Post" }
      #  it { should have_content('error') }
      #end

    end


    #describe "with valid information" do

    #  before { fill_in 'micropost_content', with: "Lorem ipsum" }
    #  it "should create a micropost" do
    #    expect { click_button "Post" }.to change(Micropost, :count).by(1)
    #  end
    #end
  end


  # DESTROY 
  #describe "DESTROY - Micropost" do
  #  before { FactoryGirl.create(:micropost, user: user) }

  #  describe "as correct user" do
  #    before { visit root_path }

  #    it "should delete a micropost" do
  #      expect { click_link "delete" }.to change(Micropost, :count).by(-1)
  #    end
  #  end
  #end


end