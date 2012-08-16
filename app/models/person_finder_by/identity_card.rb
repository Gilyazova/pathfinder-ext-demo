module PersonFinderBy
  class IdentityCard

    def find(params_model)
      params_model.parameters.each do |k, v|
        query.add(k, v)
      end

      find_run(params_model.page)
    end

    private

    def query
      @query ||= Query.new(RussianPassport.joins(:identity_card))
    end

    def find_run (current_page = 1)
      results = query.generate(current_page)

      pages_info = {
        num_pages: results.num_pages,
        current_page: results.current_page,
        total_count: results.total_count
      }

      persons = Person.find(results.pluck('identity_cards.person_id'))
      PaginableArray.new(persons, pages_info)
    end

  end
end
