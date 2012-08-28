class PhotosController < ApplicationController
  before_filter :find_person, :only => [:index]

  def index
    @photos = @person.photos.page(current_page(params)).per(max_page_size)

    respond_to do |format|
      format.xml { render }
    end
  end

  def find_person
    @person = Person.find(params[:person_id])
  rescue ActiveRecord::RecordNotFound
    head(404)
  end

end
