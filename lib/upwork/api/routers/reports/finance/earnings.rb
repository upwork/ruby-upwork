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
      module Reports
        module Finance
          # Generate Earning Reports
          class Earnings
            ENTRY_POINT = 'gds'
            
            # Init
            #
            # Arguments:
            #  client: (Client)
            def initialize(client)
              @client = client
              @client.epoint = ENTRY_POINT 
            end
            
            # Generate Earning Reports for a Specific Freelancer
            #
            # Arguments:
            #  freelancer_reference: (String)
            #  params: (Hash)
            def get_by_freelancer(freelancer_reference, params)
              $LOG.i "running " + __method__.to_s
              @client.get '/finreports/v2/providers/' + freelancer_reference + '/earnings', params
            end
            
            # Generate Earning Reports for a Specific Buyer's Team
            #
            # Arguments:
            #  buyer_team_reference: (String)
            #  params: (Hash)
            def get_by_buyers_team(buyer_team_reference, params)
              $LOG.i "running " + __method__.to_s
              @client.get '/finreports/v2/buyer_teams/' + buyer_team_reference + '/earnings', params
            end
            
            # Generate Earning Reports for a Specific Buyer's Company
            #
            # Arguments:
            #  buyer_company_reference: (String)
            #  params: (Hash)
            def get_by_buyers_company(buyer_company_reference, params)
              $LOG.i "running " + __method__.to_s
              @client.get '/finreports/v2/buyer_companies/' + buyer_company_reference + '/earnings', params
            end
          end
        end
      end
    end
  end
end
