
# jr@oblique:  25/9/14


require 'spec_helper'

describe Microcomment do

  #let(:user) { FactoryGirl.create(:user) }

  before do
    # This code is not idiomatically correct.
    #@micropost = Micropost.new(content: "Lorem ipsum", user_id: user.id)
    @microcomment = Microcomment.new(owner: "Javier", content: "This is just a microcomment...")
  end

  subject { @microcomment }

  it { should respond_to(:owner) }
  it { should respond_to(:content) }


  it { should be_valid }


  describe "when owner is not present" do
    before { @microcomment.owner = nil }
    it { should_not be_valid }
  end

end