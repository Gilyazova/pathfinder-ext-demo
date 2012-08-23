require 'spec_helper'

describe LossIssue do
  before do
    person = FactoryGirl.create(:person)
    @passport = FactoryGirl.create(:russian_passport, :person => person)
    @loss_issue = FactoryGirl.create(:loss_issue, :identity_card => @passport.identity_card)
  end

  it 'should right identity card name' do
    @passport.identity_card.loss_issue.id.should == @loss_issue.id
  end
end
