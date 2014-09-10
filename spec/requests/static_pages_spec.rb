
#jr@oblique: 10/9/14


require 'spec_helper'

describe "Static pages" do

subject { page }



  describe "Home page" do
    before { visit root_path }
    it { should have_content('Gmaps') }
 
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end


  describe "Help page" do
    before { visit help_path }
    it { should have_content('Help') }
    it { should have_title(full_title('')) }
  end



  describe "Maps page" do

    describe "Map 1" do
      before { visit map1_path }
      it { should have_content('Map 1') }
      #it { should have_title(full_title('Maps 1'))}
    end
      
    describe "Map 2" do
      before { visit map2_path }
      it { should have_content('Map 2') }
      #it { should have_title(full_title('Maps 1'))}
    end


  end


end
