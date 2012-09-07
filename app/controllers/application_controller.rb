class ApplicationController < ActionController::Base
  protect_from_forgery

  MAX_PAGE_SIZE = 10

  def current_page(params)
    [0, params[:page].to_i].max
  end

  def max_page_size
    MAX_PAGE_SIZE
  end
end
