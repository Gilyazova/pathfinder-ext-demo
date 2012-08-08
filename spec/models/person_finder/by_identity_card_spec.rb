# encoding: utf-8
require 'spec_helper'

describe PersonFinder::ByIdentityCard do
  before do
    # @person = FactoryGirl.create(:person)

    3.times do |i|

      rnd = Random.new(123456)

      person = Person.create
      passport = RussianPassport.new(first_name: "Иван#{i}",
          last_name: "Иванов#{i}",
          middle_name: "Иванович",
          birth_date: DateTime.new(rnd.rand(1950..1996), rnd.rand(11) + 1, rnd.rand(27) + 1))

      passport.build_identity_card(person: person)
      passport.save

      @person1 = person if i == 0
      @person2 = person if i == 1
      @person3 = person if i == 2

    end
  end

  describe 'simple find algorithm' do
    it 'should return empty when empty params' do
      PersonFinder::ByIdentityCard.new.find().should == []
    end
  end

  describe 'simple find algorithm' do
    it 'should return one person when unique params' do
      PersonFinder::ByIdentityCard.new.find({first_name: "Иван1"}).should == [@person2]
    end
  end

  describe 'simple find algorithm' do
    it 'should return one person when unique params' do
      PersonFinder::ByIdentityCard.new.find({first_name: "Иван0", middle_name: "Иванович"}).should == [@person1]
    end
  end

  describe 'simple find algorithm' do
    it 'should return one person when unique params' do
      PersonFinder::ByIdentityCard.new.find({middle_name: "Иванович"}).should == [@person1, @person2, @person3]
    end
  end
end
