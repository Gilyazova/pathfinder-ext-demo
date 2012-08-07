class PersonsController < ApplicationController
  before_filter :find_person, :only => [:show]

  def index
    @persons = PersonFinder::ByIdentityCard.new.find(params)

    respond_to do |format|
      format.xml { render }
      # format.json { render :json => @person }
    end
  end

  def show
    respond_to do |format|
      format.xml { render }
      # format.json { render json: {:id => 5} }
    end
  end

  private

  def find_person
    @person = Person.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head(404)
  end
end
