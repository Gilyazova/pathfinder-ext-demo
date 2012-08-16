class Query
  MAX_PAGE_SIZE = 10

  def initialize(base_query)
    @base_query = base_query
  end

  def add(param, value, type = nil)

    if value.match(/[_?*%]/)
      conditions["#{param} LIKE ?"] = value.gsub(/[*]/, '%').gsub(/[?]/, '_')
    else
      conditions["#{param} = ?"] = value
    end
  end

  def generate(page = nil)
    query = @base_query
    conditions.each{ |k, v| query = query.where(k, v) }

    query = query.where("1 = ?", -1) if conditions.empty?

    query.page(page).per(MAX_PAGE_SIZE)
  end

  private

  def conditions
    @conditions ||= Hash.new
  end
end
