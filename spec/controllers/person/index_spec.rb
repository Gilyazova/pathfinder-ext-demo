# encoding: utf-8
require 'spec_helper'

describe PersonsController do
  context "test for one page" do
    before do
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

    describe 'should return empty when empty params' do
      before  do
        get :index
      end

      # its (:status) {should == 200}

      it 'should return persons' do
        assigns(:persons).should == []
      end
    end

    describe 'should return one unique persons' do
      before  do
        get :index, first_name: "Иван0", last_name: "Иванов0"
      end

      # its (:status) {should == 200}

      it 'should return persons' do
        assigns(:persons).should == [@person1]
      end
    end

    describe 'should return one unique persons' do
      before  do
        get :index, middle_name: "Иванович"
      end

      it 'should return persons' do
        assigns(:persons).should == [@person1, @person2, @person3]
      end

      it 'should have page info' do
        assigns(:persons).current_page.should == 1
        assigns(:persons).num_pages.should == 1
        assigns(:persons).total_count.should == 3
      end
    end
  end

  context "test for few page" do
    before do
      @persons = []

      13.times do |i|

        rnd = Random.new(123456)

        person = Person.create
        passport = RussianPassport.new(first_name: "Иван#{i}",
            last_name: "Иванов#{i}",
            middle_name: "Иванович",
            birth_date: DateTime.new(rnd.rand(1950..1996), rnd.rand(11) + 1, rnd.rand(27) + 1))

        passport.build_identity_card(person: person)
        passport.save

        @persons << person
      end
    end

    describe 'should return one unique persons' do
      before  do
        get :index, middle_name: "Иванович", page: 2
      end

      it 'should return persons' do
        assigns(:persons).should == [@persons[10], @persons[11], @persons[12]]
      end

      it 'should have page info' do
        assigns(:persons).current_page.should == 2
        assigns(:persons).num_pages.should == 2
        assigns(:persons).total_count.should == 13
      end
    end

  end
end
