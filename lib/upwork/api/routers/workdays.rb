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
# Copyright:: Copyright 2015(c)Upwork.com
# License::   See LICENSE.txt and TOS - https://developers.upwork.com/api-tos.html

module Upwork
  module Api
    module Routers
      # Workdays
      class Workdays
        ENTRY_POINT = 'api'
        
        # Init
        #
        # Arguments:
        #  client: (Client)
        def initialize(client)
          @client = client
          @client.epoint = ENTRY_POINT 
        end
        
        # Get Workdays by Company
        # Arguments:
        #  company: (String)
        #  from_date: (String)
        #  till_date: (String)
        #  params: (Hash)
        def get_by_company(company, from_date, till_date, params = {})
          $LOG.i "running " + __method__.to_s
          @client.get '/team/v3/workdays/companies/' + company + '/' + from_date + ',' + till_date, params
        end
        
        # Get Workdays by Contract
        # Arguments:
        #  contract: (String)
        #  from_date: (String)
        #  till_date: (String)
        #  params: (Hash)
        def get_by_contract(contract, from_date, till_date, params = {})
          $LOG.i "running " + __method__.to_s
          @client.get '/team/v3/workdays/contracts/' + contract + '/' + from_date + ',' + till_date, params
        end
      end
    end
  end
end
