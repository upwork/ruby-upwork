# Licensed under the Upwork's API Terms of Use;
# you may not use this file except in compliance with the Terms.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Author::    Maksym Novozhylov (mnovozhilov@upwork.com)
# Copyright:: Copyright 2014(c) Upwork.com
# License::   See LICENSE.txt and TOS - https://developers.upwork.com/api-tos.html

require 'json'
require 'uri'


module Upwork
  module Api
    # Client for accessing API
    class Client
      DATA_FORMAT   = 'json'
      OVERLOAD_VAR  = "http_method"
      
      URI_AUTH    = "/services/api/auth"
      URI_RTOKEN  = "/auth/v1/oauth/token/request"
      URI_ATOKEN  = "/auth/v1/oauth/token/access"
      
      attr_accessor :epoint
      attr_reader :url_auth, :url_rtoken, :url_atoken
      
      # Init client
      #
      # Arguments:
      #  config: (Config)
      def initialize(config)
        $LOG.i('initializing client')
        @config = config
        @epoint = Upwork::Api::DEFAULT_EPOINT
        @url_auth, @url_rtoken, @url_atoken = Upwork::Api::BASE_HOST + URI_AUTH, self.full_url(URI_RTOKEN), self.full_url(URI_ATOKEN)
      end
      
      # Start auth process and get authorization token
      def get_authorization_url
        $LOG.i "requesting autorization token"
        @consumer=OAuth::Consumer.new @config.consumer_key, 
                                      @config.consumer_secret, 
                                      {:site                => Upwork::Api::BASE_HOST,
                                       :request_token_path  => '/' + Upwork::Api::DEFAULT_EPOINT + URI_RTOKEN,
                                       :access_token_path   => '/' + Upwork::Api::DEFAULT_EPOINT + URI_ATOKEN,
                                       :authorize_path      => URI_AUTH,
                                       :signature_method    => @config.signature_method}
        
        @request_token = @consumer.get_request_token
        $LOG.i "got request token pair", @request_token
        
        $LOG.i "building authorization url, which is", @request_token.authorize_url
        @request_token.authorize_url
      end
      
      # Finish auth process and get access token
      #
      # Arguments:
      #  verifier: (String)
      def get_access_token(verifier)
        $LOG.i "getting access token pair"
        @access_token = @request_token.get_access_token(:oauth_verifier => verifier)
        $LOG.i "got access token pair", @access_token
        $LOG.i "save access token data in config object"
        
        @config.access_token  = @access_token.token
        @config.access_secret = @access_token.secret
        
        @access_token
      end
      
      # Run GET request
      #
      # Arguments:
      #  uri: (String)
      #  param: (Hash)
      def get(uri, params = {})
        send_request(uri, :get, params)
      end
      
      # Run POST request
      #
      # Arguments:
      #  uri: (String)
      #  param: (Hash)
      def post(uri, params = {})
        send_request(uri, :post, params)
      end
      
      # Run PUT request
      #
      # Arguments:
      #  uri: (String)
      #  param: (Hash)
      def put(uri, params = {})
        send_request(uri, :put, params)
      end
      
      # Run DELETE request
      #
      # Arguments:
      #  uri: (String)
      #  param: (Hash)
      def delete(uri, params = {})
        send_request(uri, :delete, params)
      end
      
      # Get full URL
      def full_url(uri) # :nodoc:
        Upwork::Api::BASE_HOST + '/' + (@epoint) + get_uri_with_format(uri);
      end
      
      # Get URI with :format
      def get_uri_with_format(uri) # :nodoc:
        uri + ((@epoint == 'api') ? '.' + DATA_FORMAT : '')
      end
      
      private
      
      # get url with parameters for get requests
      def get_url_with_params(path, params)
        "#{path}?".concat(params.collect{|k,v| "#{k}=#{OAuth::Helper::escape(v.to_s)}"}.join("&"))
      end
      
      # Send request
      def send_request(uri, method = :get, params = {}) # :nodoc:
        $LOG.i "send request for url", uri
        $LOG.i "and method", method
        
        if method == :put or method == :delete
          $LOG.i "add overload parameter"
          params[OVERLOAD_VAR] = method.to_s
        end
        
        $LOG.i "and parameters", params
        
        @consumer=OAuth::Consumer.new @config.consumer_key, 
                                      @config.consumer_secret, 
                                      {:site        => Upwork::Api::BASE_HOST + '/' + @epoint,
                                       :http_method => method}
        @access_token = OAuth::AccessToken.new(@consumer, @config.access_token, @config.access_secret)

        case method
        when :get
          url = get_url_with_params get_uri_with_format(uri), params
          response = @access_token.get(url).body
        when :post, :put, :delete
          response = @access_token.post(get_uri_with_format(uri), params).body
        else
          raise ArgumentError, "Don't know how to handle http method: :#{method.to_s}"
        end
        $LOG.i "got response from server", response
        JSON.parse(response)
      end
      
    end
  end
end
