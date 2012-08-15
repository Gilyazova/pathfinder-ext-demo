module PersonFinderBy
  class IdentityCardParams

    ALLOWED_PARAMS = {
      :first_name => :first_name,
      :last_name => :last_name,
      :middle_name => :middle_name
    }

    def initialize(params = {})
      conditions = {}
      ALLOWED_PARAMS.each do |k, v|
        next if !params.key?(k) || params[k].blank?
        parameters[v] = params[k]
      end

      @page = [0, params[:page].to_i].max
    end

    def page
      @page ||= 0
    end

    def valid?
      true
    end

    def parameters
      @parameters ||= Hash.new
    end
  end
end
