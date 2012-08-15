require 'spec_helper'

describe "persons/show.xml.erb" do
  before do
    @person = FactoryGirl.create(:person)
    # FactoryGirl.create(:russian_passport, :person => person)
  end

  it 'should be rendered' do
    lambda { render }.should_not raise_error
  end
end
