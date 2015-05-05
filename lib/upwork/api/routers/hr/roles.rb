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
        # Roles
        class Roles
          ENTRY_POINT = 'api'
          
          # Init
          #
          # Arguments:
          #  client: (Client)
          def initialize(client)
            @client = client
            @client.epoint = ENTRY_POINT 
          end
          
          # Get user roles
          def get_all
            $LOG.i "running " + __method__.to_s
            @client.get '/hr/v2/userroles'
          end
          
          # Get by specific user
          #
          # Arguments:
          #  reference: (String)
          def get_by_specific_user(user_reference)
            $LOG.i "running " + __method__.to_s
            @client.get '/hr/v2/userroles/' + user_reference
          end
        end
      end
    end
  end
end