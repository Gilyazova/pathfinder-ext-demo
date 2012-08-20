module PersonFinder
  #
  # Пока все ищет в памяти!
  #
  class IdentityCard

    def find(search_params)#params_model
      @_search_params = search_params

      person_ids = (cached || finded).
        page(search_params.page).
        per(search_params.page_size)

      persons = Person.find(person_ids)

      pages_info = {
        num_pages: person_ids.num_pages,
        current_page: person_ids.current_page,
        total_count: person_ids.total_count
      }

      PaginableArray.new(persons, pages_info)
    end

    def cached
      #@_search_params.unique_hash
      nil
    end

    def finded
      person_ids = []

      sources = [IdentityCardQuery, RussianPassportQuery, InternationalPassportQuery]
      sources.each do |src|
        person_ids << src.new.where(@_search_params.bare_params)
      end
      #здесь сохраняем кэш (найденные id в базу)

      Kaminari::PaginatableArray.new(person_ids.flatten.uniq.sort)
    end
  end
end
