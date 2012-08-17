module PersonFinder
  class IdentityCardQuery < IdentityCardQueryBase

    private

    def allowed_params
      {
        :number => :number,
        :serie => :number,
      }
    end

    def query
      Query.new(::IdentityCard.scoped)
    end

    def pluck
      # 'identity_cards.person_id'
      'person_id'
    end

  end
end
