
# jr@oblique:  15/9/14


require 'spec_helper'

describe Point do


  let(:map) { FactoryGirl.create(:map) }


  before { @point = map.points.build(name: "Lorem ipsum") }
  # This code is not idiomatically correct.
  #before do 
  #  @point = Point.new(name: "Lorem ipsum", map_id: map.id)
  #end


  subject { @point }

  it { should respond_to(:name) }
  it { should respond_to(:map_id) }

  it { should respond_to(:map) }
  its(:map) { should eq map }


  it { should be_valid }




# Not valid
  describe "when map_id is not present" do
    before { @point.map_id = nil }
    it { should_not be_valid }
  end


  describe "with no name" do
    before { @point.name = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @point.name = "a" * 141 }
    it { should_not be_valid }
  end

end
