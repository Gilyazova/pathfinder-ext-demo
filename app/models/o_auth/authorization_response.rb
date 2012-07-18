# encoding: UTF-8
class OAuth::AuthorizationResponse
  attr_reader :request, :grant

  def initialize(request, grant)
    @request = request
    @grant = grant
  end

  def response_uri
    uri = URI(request.redirect_uri)
    uri.query = [uri.query, "state=#{request.state}", "code=#{grant.code}"].compact.join('&')
    uri.to_s
  end
end
