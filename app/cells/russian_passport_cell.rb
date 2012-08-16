class RussianPassportCell < Cell::Rails
  def show(russian_passport)
    @russian_passport = russian_passport
    render
  end
end
