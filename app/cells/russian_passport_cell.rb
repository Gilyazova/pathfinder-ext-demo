class RussianPassportCell < Cell::Rails
  def show(identity_card, russian_passport)
    @russian_passport = russian_passport
    # @person = params[:person]
    render
  end
end
