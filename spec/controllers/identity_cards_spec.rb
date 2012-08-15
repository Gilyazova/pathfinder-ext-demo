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

        person = FactoryGirl.create(:person)
        3.times do |i|
          FactoryGirl.create(:russian_passport, :person => person)
        end

        get :index, person_id: person.id, :format => :xml
      end

      its(:status) { should == 200}

      it 'assigns identity cards' do
        # p assigns(:identity_cards).first
        assigns(:identity_cards).count.should == 3#should_not be_nil
      end

      it 'should have page info' do
        assigns(:identity_cards).current_page.should == 1
        assigns(:identity_cards).num_pages.should == 1
        assigns(:identity_cards).total_count.should == 3
      end
    end

    # describe 'and return right data' do
    #   before do 
    #     person = FactoryGirl.create(:person)
    #     rp = FactoryGirl.create(:russian_passport, :person => person)
    #     rp.identity_card.number = '111111'
    #     rp.identity_card.serie = '222222'
    #     # rp.identity_card.number = '111111'

    #     get :index, person_id: person.id, :format => :xml
    #   end

    #   it '' do
    #     response.status.should == 200
    #   end
    # end

  end
end
