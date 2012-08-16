class PaginableArray < Array
  def initialize(original_array = [], options = {})
    @_original_array = original_array
    @_current_page = options[:current_page]
    @_num_pages = options[:num_pages]
    @_total_count = options[:total_count]

    super original_array
  end

  def total_count
    @_total_count || @_original_array.count
  end

  def num_pages
    @_num_pages || 1
  end

  def current_page
    @_current_page || 1
  end
end
