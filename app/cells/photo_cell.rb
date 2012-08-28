class PhotoCell < Cell::Rails
  def show(photo)
    @photo = photo
    render
  end
end
