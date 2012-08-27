require 'spec_helper'

describe PersonRelation do
  describe 'test wife and childs' do
    before do
      @person = FactoryGirl.create(:person)
      @wife = FactoryGirl.create(:person)
      @child1 = FactoryGirl.create(:person)
      @child2 = FactoryGirl.create(:person)
      @person.relations.build(:children => @wife, :type_id => 1)
      @person.relations.build(:children => @child1, :type_id => 2)
      @person.relations.build(:children => @child2, :type_id => 2)
      @person.save
    end

    it 'person have 3 relations' do
      @person.relations.count.should == 3
    end

    it 'wife is child relation for person' do
      @person.relations.first.children.id.should == @wife.id
    end

    it 'wife is child relation for person' do
      @person.relations.all[1].children.id.should == @child1.id
    end

    it 'wife is child relation for person' do
      @person.relations.all[2].children.id.should == @child2.id
    end

    # it 'wife has relation for peson' do
    #   @wife
    # end

  end
end
