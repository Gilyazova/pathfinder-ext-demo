class IdentityCardsController < ApplicationController
  MAX_PAGE_SIZE = 10

  before_filter :find_person, :only => [:index]

  def index

    @identity_cards = @person.identity_cards.page(current_page(params)).per(MAX_PAGE_SIZE)

    respond_to do |format|
      format.xml { render }
      # format.json { render :json => @person }
    end
  end

  private

  def current_page(params)
    [0, params[:page].to_i].max
  end


  def find_person
    @person = Person.find(params[:person_id])
  rescue ActiveRecord::RecordNotFound
    head(404)
  end
end
