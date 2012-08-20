class InternationalPassportCell < Cell::Rails
  def show(international_passport)
    @international_passport = international_passport
    render
  end
end
