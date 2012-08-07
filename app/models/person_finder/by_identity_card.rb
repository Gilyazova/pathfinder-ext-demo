module PersonFinder
  class ByIdentityCard
    MAX_PAGE_SIZE = 10
    ALLOWED_PARAMS = [:first_name, :last_name, :middle_name]

    def find(params = { })
      q = RussianPassport.joins(:identity_card)
      ALLOWED_PARAMS.each do |p|
        next unless params.key?(p)
        q = q.where("#{p} = ?", params[p])
      end
      # .where(:identity_cards => {:id => 2}).
      q = q.page(current_page(params)).per(MAX_PAGE_SIZE).pluck('identity_cards.person_id')

      return Person.find(q)
      # Person.find(RussianPassport.joins(:identity_card).where('last_name LIKE ?', 'Ив__ов').pluck('identity_cards.person_id'))
      # RussianPassport.joins(:identity_card).where(:identity_cards => {:id => 2}).pluck('identity_cards.person_id')
    end

    private

    def current_page(params)
      [0, params[:page].to_i].max
    end
  end
end
