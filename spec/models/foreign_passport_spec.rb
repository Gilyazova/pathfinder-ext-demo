require 'spec_helper'

describe ForeignPassport do
  describe 'identity card' do
    before do
      person = FactoryGirl.create(:person)
      @passport = FactoryGirl.create(:foreign_passport, :person => person)
    end

    it 'should right identity card name' do
      @passport.identity_card.identity_card_name.should == 'foreign_passport'
    end
  end
end
