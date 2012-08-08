require 'spec_helper'

describe FakePaginatableArray do
  describe 'simple init' do
    before do
      @arr = FakePaginatableArray.paginate_array([1,2,3,4,5,6])
    end

    subject { @arr }

    its(:total_count) { should == 6}
    its(:num_pages) { should == 1}
    its(:current_page) { should == 1}
  end


  describe 'not simple init' do
    before do
      options = {
        num_pages: 44,
        current_page: 12,
        total_count: 800
      }
      @arr = FakePaginatableArray.paginate_array([1,2,3,4,5,6], options)
    end

    subject { @arr }

    its(:total_count) { should == 800}
    its(:num_pages) { should == 44}
    its(:current_page) { should == 12}
  end
end
