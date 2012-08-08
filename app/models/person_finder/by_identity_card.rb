module PersonFinder
  class ByIdentityCard

    MAX_PAGE_SIZE = 10
    ALLOWED_PARAMS = {
      :first_name => :first_name,
      :last_name => :last_name,
      :middle_name => :middle_name
    }

    def find(params = { })
      q = RussianPassport.joins(:identity_card)

      calculate_conditions(params).each { |k,v| q = q.where(k, v) }

      q = q.page(current_page(params)).per(MAX_PAGE_SIZE)
      options = {
        num_pages: q.num_pages,
        current_page: q.current_page,
        total_count: q.total_count
      }

      return FakePaginatableArray.paginate_array(Person.find(q.pluck('identity_cards.person_id')), options)

      # .where(:identity_cards => {:id => 2}).
      # Person.find(RussianPassport.joins(:identity_card).where('last_name LIKE ?', 'Ив__ов').pluck('identity_cards.person_id'))
      # RussianPassport.joins(:identity_card).where(:identity_cards => {:id => 2}).pluck('identity_cards.person_id')
    end

    private

    def current_page(params)
      [0, params[:page].to_i].max
    end

    def calculate_conditions(params)

      conditions = []
      ALLOWED_PARAMS.each do |k,v|
        next if !params.key?(k) || params[k].blank?
        conditions << ["#{v} = ?", params[v]]
      end
      conditions << ["1 = ?", -1] if conditions.empty?
      conditions
    end

  end
end
