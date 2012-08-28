require 'spec_helper'

describe Photo do
  before do
    person = FactoryGirl.create(:person)
    @russian_passport = FactoryGirl.create(:russian_passport, :person => person)
    person.photos.create(FactoryGirl.attributes_for(:photo, :owner => @russian_passport))
    person.photos.create(FactoryGirl.attributes_for(:photo, :owner => @russian_passport))
  end

  it 'should have 2 photos' do
    Photo.count.should == 2
    # @passport.identity_card.declaration_issue.id.should == @declaration_issue.id
    # @passport.identity_card.identity_card_name.should == 'russian_passport'
  end

  describe 'photo 1 test' do

    subject { Photo.all[0] }

    its(:owner) { should == @russian_passport}
    its(:owner_type) { should == @russian_passport.class.name }
  end

  describe 'photo 2 test' do

    subject { Photo.all[1] }

    its(:owner) { should == @russian_passport}
    its(:owner_type) { should == @russian_passport.class.name }
  end
end
