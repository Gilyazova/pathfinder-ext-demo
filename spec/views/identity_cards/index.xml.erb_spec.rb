require 'spec_helper'

describe "identity_cards/index.xml.erb" do
  before do
    person = FactoryGirl.create(:person)
    FactoryGirl.create(:russian_passport, :person => person)
    @identity_cards = PaginatableArray.new(person.identity_cards)
  end

  it 'should be rendered' do
    lambda { render }.should_not raise_error
  end
end
