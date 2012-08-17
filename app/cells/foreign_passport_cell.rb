class ForeignPassportCell < Cell::Rails
  def show(foreign_passport)
    @foreign_passport = foreign_passport
    render
  end
end
