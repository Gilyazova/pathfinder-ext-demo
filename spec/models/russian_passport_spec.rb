require 'spec_helper'

describe RussianPassport do
  describe 'identity card' do
    before do
      person = FactoryGirl.create(:person)
      @russian_passport = FactoryGirl.create(:russian_passport, :person => person)
    end

    it 'should right identity card name' do
      @russian_passport.identity_card.identity_card_name.should == 'russian_passport'
    end
  end
end
