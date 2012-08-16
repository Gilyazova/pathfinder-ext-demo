class IdentityCardCell < Cell::Rails
  def show(identity_card)
    @identity_card = identity_card
    render
  end
end
