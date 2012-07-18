# encoding: UTF-8

# Контроллер отвечает за реализацию протокола "OAuth 2":http://tools.ietf.org/html/draft-ietf-oauth-v2-28.
#
# Authors:: Молоков В. (mailto:viacheslav.molokov@gmail.com)
#
#
class AuthController < ApplicationController

  # Метод для обработки запроса на получение разрешения на авторизацию
  def authorize
    auth_request = OAuth::AuthorizationRequest.new(params)
    auth_grant = OAuth::AuthorizationGrant.new
    redirect_to OAuth::AuthorizationResponse.new(auth_request, auth_grant).response_uri
  end

  # Метод для получения токена по коду авторизации
  def token
    response['Cache-Control'] = 'no-store'
    render :json => {
      "access_token" => "2YotnFZFEjr1zCsicMWpAA",
      "token_type" => "bearer",
      "expires_in" => 3600,
      "refresh_token" => "tGzv3JOkF0XG5Qx2TlKWIA"
    }
  end
end
