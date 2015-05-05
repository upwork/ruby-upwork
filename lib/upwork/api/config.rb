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

module Upwork
  module Api
    # Config storage
    class Config
      @@debug = false;
      
      attr_accessor :access_token, :access_secret
      attr_reader :consumer_key, :consumer_secret, :signature_method
      
      # Init config object
      #
      # Arguments:
      #  config: (Hash)
      def initialize(config = {})
        @consumer_key, @consumer_secret = config['consumer_key'], config['consumer_secret']
        @access_token, @access_secret = config['access_token'], config['access_secret']
        @signature_method = config['signature_method']
        @@debug = config['debug']

        $DEBUG = self.debug
      end

      # Get debug status
      def debug # :nodoc:
        @@debug
      end
    end
  end
end