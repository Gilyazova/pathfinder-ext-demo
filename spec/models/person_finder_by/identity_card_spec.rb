# encoding: utf-8
require 'spec_helper'

describe PersonFinderBy::IdentityCard do
  before do
    @persons = []
    3.times do |i|
      person = FactoryGirl.create(:person)
      @persons << person
      FactoryGirl.create(:russian_passport, :person => person)
    end
  end

  describe 'simple find algorithm' do
    it 'should return empty when empty params' do
      params = PersonFinderBy::IdentityCardParams.new
      PersonFinderBy::IdentityCard.new.find(params).should == []
    end
  end

  describe 'simple find algorithm' do
    let(:person) { @persons[1] }
    it 'should return one person when unique params' do
      passport = person.identity_cards[0].extended_by
      params = PersonFinderBy::IdentityCardParams.new({first_name: passport.first_name})
      PersonFinderBy::IdentityCard.new.find(params).should == [@persons[1]]
    end
  end

  describe 'simple find algorithm' do
    let(:person) { @persons[0] }
    it 'should return one person when unique params' do
      passport = person.identity_cards[0].extended_by
      params = PersonFinderBy::IdentityCardParams.new({first_name: passport.first_name, middle_name: passport.middle_name})
      PersonFinderBy::IdentityCard.new.find(params).should == [@persons[0]]
    end
  end

  describe 'simple find algorithm' do
    it 'should return one person when unique params' do
      params = PersonFinderBy::IdentityCardParams.new({middle_name: "Иванович"})
      PersonFinderBy::IdentityCard.new.find(params).should == @persons
    end
  end

  describe 'find algorithm with "*" symbol' do
    it 'should return one person when unique params' do
      params = PersonFinderBy::IdentityCardParams.new({middle_name: "Иванов*"})
      PersonFinderBy::IdentityCard.new.find(params).should == @persons
    end
  end

  describe 'find algorithm with "?" symbol' do
    it 'should return one person when unique params' do
      params = PersonFinderBy::IdentityCardParams.new({middle_name: "Иванов??"})
      PersonFinderBy::IdentityCard.new.find(params).should == @persons
    end
  end

end
