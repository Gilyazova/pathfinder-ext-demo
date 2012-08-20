require 'spec_helper'

describe InternationalPassport do
  describe 'identity card' do
    before do
      person = FactoryGirl.create(:person)
      @passport = FactoryGirl.create(:international_passport, :person => person)
    end

    it 'should right identity card name' do
      @passport.identity_card.identity_card_name.should == 'international_passport'
    end
  end
end
