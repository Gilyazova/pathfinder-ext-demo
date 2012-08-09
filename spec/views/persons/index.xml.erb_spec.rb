require 'spec_helper'

describe "persons/index.xml.erb" do
  before do
    @persons = PaginatableArray.new([FactoryGirl.create(:person)])
    # FactoryGirl.create(:russian_passport, :person => person)
  end

  it 'should be rendered' do
    lambda { render }.should_not raise_error
  end
end
