module PersonFinder
  class RussianPassportQuery < IdentityCardQueryBase

    protected

    def allowed_params
      {
        :first_name => :first_name,
        :last_name => :last_name,
        :middle_name => :middle_name
      }
    end

    def query
      Query.new(::RussianPassport.joins(:identity_card))
    end

    def pluck
      'identity_cards.person_id'
    end
  end
end
