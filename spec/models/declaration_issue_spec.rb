require 'spec_helper'

describe DeclarationIssue do
  before do
    person = FactoryGirl.create(:person)
    @passport = FactoryGirl.create(:russian_passport, :person => person)
    @declaration_issue = FactoryGirl.create(:declaration_issue, :identity_card => @passport.identity_card)
  end

  it 'should right identity card name' do
    @passport.identity_card.declaration_issue.id.should == @declaration_issue.id
    # @passport.identity_card.identity_card_name.should == 'russian_passport'
  end
end

