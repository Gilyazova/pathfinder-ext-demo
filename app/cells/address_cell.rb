class AddressCell < Cell::Rails
  def show(address)
    @addr = address
    render
  end
end
