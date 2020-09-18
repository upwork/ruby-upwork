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
    module Routers
      module Hr
        module Freelancers
          # Freelancers Job Offers API
          class Offers
            ENTRY_POINT = 'api'
            
            # Init
            #
            # Arguments:
            #  client: (Client)
            def initialize(client)
              @client = client
              @client.epoint = ENTRY_POINT 
            end
            
            # Get list of offers
            #
            # Arguments:
            #  params: (Hash)
            def get_list(params = {})
              $LOG.i "running " + __method__.to_s
              @client.get '/offers/v1/contractors/offers', params
            end
            
            # Get specific offer
            #
            # Arguments:
            #  reference: (String)
            def get_specific(reference)
              $LOG.i "running " + __method__.to_s
              @client.get '/offers/v1/contractors/offers/' + reference
            end
            
            # Apply specific action
            #
            # Arguments:
            #  reference: (String)
            #  params: (Hash)
            def actions(reference, params)
              $LOG.i "running " + __method__.to_s
              @client.post '/offers/v1/contractors/actions/' + reference, params
            end
          end
        end
      end
    end
  end
end
