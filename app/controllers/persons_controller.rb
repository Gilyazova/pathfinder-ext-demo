class PersonsController < ApplicationController
  before_filter :find_person, :only => [:show]
  before_filter :fetch_find_params, :only => [:index]

  def index
    @persons = PersonFinderBy::IdentityCard.new.find(@find_parameters)
    respond_to do |format|
      format.xml { render }
    end
  end

  def show
    respond_to do |format|
      format.xml { render }
    end
  end

  private

  def find_person
    @person = Person.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head(404)
  end

  def fetch_find_params
    @find_parameters = PersonFinderBy::IdentityCardParams.new(params)

    head(404) unless @find_parameters.valid?
  end


end
