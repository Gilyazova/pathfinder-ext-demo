require 'spec_helper'

describe PersonFinder::ByIdentityCard do
  before do
    @person = FactoryGirl.create(:person)
  end
  # Why didn't work?
  # let(:person) { FactoryGirl.create(:person) }

  describe 'simple find algorithm' do
    it 'person_included? should work :)' do
      PersonFinder::ByIdentityCard.new.find().should == [@person]
    end
  end
end
