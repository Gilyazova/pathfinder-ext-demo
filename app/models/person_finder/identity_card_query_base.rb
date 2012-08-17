module PersonFinder
  class IdentityCardQueryBase

    def where(params = {})
      q = query

      allowed_params.each do |k, v|
        next if !params.key?(k) || params[k].blank?
        q.add(v, params[k])
      end

      q.empty? ? [] : q.generate.pluck(pluck)
    end

    protected

    def allowed_params
      nil
    end

    def query
      nil
    end

    def pluck
      nil
    end

  end
end
