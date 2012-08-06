class PersonsController < ApplicationController
  before_filter :find_person, :only => [:show]

  def show
    respond_to do |format|
      format.xml { render :xml => @person }
      format.json { render :json => @person }
    end
  end

  private

  def find_person
    @person = Person.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head(404)
  end
end
