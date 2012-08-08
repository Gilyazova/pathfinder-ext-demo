# encoding: utf-8
require 'spec_helper'

describe IdentityCardsController do
  describe '#index' do

    describe 'person doesnt exist case' do
      it 'should return 404 if person doesnt exists' do
        get :index, person_id: 1, :format => :xml
        response.status.should == 404
      end
    end


    describe 'person exist case' do
      before do

        @person = Person.create
        rnd = Random.new(123456)

        3.times do |i|
          passport = RussianPassport.new(first_name: "Петр#{i}",
              last_name: "Петров#{i}",
              middle_name: "Петрович",
              birth_date: DateTime.new(rnd.rand(1950..1996), rnd.rand(11) + 1, rnd.rand(27) + 1))

          passport.build_identity_card(person: @person)
          passport.save

          get :index, person_id: @person.id, :format => :xml  
        end
      end

      its(:status) { should == 200}

      it 'assigns identity cards' do
        p assigns(:identity_cards).first
        assigns(:identity_cards).count.should == 3#should_not be_nil
      end

      it 'should have page info' do
        assigns(:identity_cards).current_page.should == 1
        assigns(:identity_cards).num_pages.should == 1
        assigns(:identity_cards).total_count.should == 3
      end
    end

  end
end
