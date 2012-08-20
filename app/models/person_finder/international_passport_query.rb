module PersonFinder
  class InternationalPassportQuery < IdentityCardQueryBase

    protected

    def allowed_params
      {
        :first_name => :first_name,
        :last_name => :last_name,
        :middle_name => :middle_name,
        :first_name_latin => :first_name,
        :last_name_latin => :last_name,
      }
    end

    def query
      Query.new(InternationalPassport.joins(:identity_card))
    end

    def pluck
      'identity_cards.person_id'
    end

  end
end
