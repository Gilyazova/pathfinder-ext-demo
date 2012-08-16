class PersonCell < Cell::Rails
  def show(params)
    @person = params[:person]
    render
  end
end
