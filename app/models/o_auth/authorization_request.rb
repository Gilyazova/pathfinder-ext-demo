# encoding: UTF-8
class OAuth::AuthorizationRequest
  attr_reader :redirect_uri
  attr_reader :state

  def initialize(params)
    @response_type = params[:response_type].to_s
    @client_id = params[:client_id].to_s
    @redirect_uri = params[:redirect_uri].to_s
    @scope = params[:scope].to_s
    @state = params[:state].to_s
  end
end
