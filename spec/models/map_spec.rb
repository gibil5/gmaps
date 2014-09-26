
#jr@oblique: 15/9/14


require 'spec_helper'

describe Map do

  before do
    @map = Map.new(
                      name: "Restaurant",
                      map_type: "xx",
                      created_by: "Javier",
                      last_updated_by: "Javier",
                      comments: "Just a test"
                      )
  end


  subject { @map }


  # test the existence of methods and attributes,     using Rubys respond_to? method 
  it { should respond_to(:name) }
  it { should respond_to(:map_type) }
  it { should respond_to(:created_by) }
  it { should respond_to(:last_updated_by) }
  it { should respond_to(:comments) }


  it { should respond_to(:points) }

  it { should be_valid }



# jx 

  # Points 
  describe "point associations" do

    before { @map.save }


    #let!(:older_point) do
    #  FactoryGirl.create(:point, map: @map, created_at: 1.day.ago)
    #end

    #let!(:newer_point) do
    #  FactoryGirl.create(:point, map: @map, created_at: 1.hour.ago)
    #end

    #it "should have the right points in the right order" do
    #  expect(@map.points.to_a).to eq [newer_point, older_point]
    #end



    #it "should destroy associated points" do
    #  points = @map.points.to_a
    #  @map.destroy
    #  expect(points).not_to be_empty
    #  points.each do |point|
    #    expect(Point.where(id: point.id)).to be_empty
    #  end
    #end
    
  end
end


