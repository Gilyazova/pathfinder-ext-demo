require 'spec_helper'

describe 'OAuth2' do
  it 'routes to authorize' do
    get('/authorize').should route_to('auth#authorize')
  end

  it 'routes to token' do
    post('/token').should route_to('auth#token')
  end
end
