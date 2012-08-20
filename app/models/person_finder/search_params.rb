module PersonFinder
  class SearchParams
    PAGE_SIZE = 10

    def initialize(params = {})
      @_params = params
    end

    def page
      @_params[:page] || 1
    end

    def page_size
      PAGE_SIZE
    end

    def bare_params
      @_params
    end

    def unique_hash
        # вообще-то здесь должен вычисляться уникальный хеш из параметров
      '123456789'
    end
  end
end
