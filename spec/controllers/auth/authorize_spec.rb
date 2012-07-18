require 'spec_helper'

require 'uri'

describe AuthController do
  describe '#authorize request' do
    context 'as expected by OAuth2 spec' do
      let(:redirect_uri) { 'https://client.example.com/cb' }
      let(:state) { 'xyz' }
      before do
        get :authorize, {
          :response_type => 'code',
          :client_id => 's6BhdRkqt3',
          :state => state,
          :redirect_uri => redirect_uri
        }
      end

      it 'should respond 302 Found' do
        response.code.should == "302"
      end

      context 'should redirect to location' do
        let(:params) do
          params_hash = HashWithIndifferentAccess.new
          uri = URI(response.location)
          uri.query.split(/&/).each do |params_pair|
            params = params_pair.split(/=/)
            params_hash[params[0]] = params[1]
          end
          params_hash
        end

        it 'provided in redirect_uri' do
          response.location.should match(/\A#{redirect_uri}/)
        end

        it 'with provided state' do
          params[:state].should == state
        end

        it 'with generated authorization code' do
          params.should include(:code)
        end
      end
    end
  end
end
