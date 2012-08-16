require 'spec_helper'

describe PersonsController do
  describe '#show' do

    describe 'person doesnt exist case' do
      it 'should return 404 if person doesnt exists' do
        get :show, id: 1
        response.status.should == 404
      end
    end

    # describe 'person exists and request json format' do
    #   before do
    #     @person = FactoryGirl.create(:person)
    #     get :show, id: @person.id, :format => :json
    #   end

    #   it 'should return person json' do
    #     response.status.should == 200
    #     assigns(:person).should_not be_nil
    #   end
    # end

    describe 'person exists and request xml format' do
      before do
        @person = FactoryGirl.create(:person)
        get :show, id: @person.id, :format => :xml
      end

      it 'should return person xml' do
        response.status.should == 200
        assigns(:person).should_not be_nil
      end
    end

    describe 'person exists and request html format' do
      before do
        @person = FactoryGirl.create(:person)
        get :show, id: @person.id
      end

      it 'should return person xml' do
        response.status.should == 406
      end
    end

  end
end
