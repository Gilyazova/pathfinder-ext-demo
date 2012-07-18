require 'spec_helper'

require 'uri'

describe AuthController do
  describe '#token' do
    context 'request as expected by OAuth2 spec' do
      let(:redirect_uri) { 'https://client.example.com/cb' }
      let(:state) { 'xyz' }
      before do
        put :token, {
          :grant_type => 'authorization_code',
          :code => 'SplxlOBeZQQYbYS6WxSbIA',
          :redirect_uri => 'https://client.example.com/cb',
          :format => 'json'
        }
      end

      it 'should respond 200 OK' do
        response.code.should == "200"
      end

      context 'should set follwoing headers' do
        it 'Cache-Control: no-store' do
          response.headers['Cache-Control'].should == 'no-store'
        end
      end
    end
  end
end
