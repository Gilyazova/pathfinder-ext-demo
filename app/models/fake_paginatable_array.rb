class FakePaginatableArray < Array
  def initialize(original_array = [], options = {})
    @_original_array = original_array
    @_current_page = options[:current_page]
    @_num_pages = options[:num_pages]
    @_total_count = options[:total_count]

    super original_array
  end

  def total_count
    return @_total_count unless @_total_count.nil?
    @_original_array.count
  end

  def num_pages
    return @_num_pages unless @_num_pages.nil?
    1
  end

  def current_page
    return @_current_page unless @_current_page.nil?
    1
  end  

  def self.paginate_array(array, options = {})
    FakePaginatableArray.new array, options
  end
end
