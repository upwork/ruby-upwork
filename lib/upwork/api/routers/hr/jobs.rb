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
        # Jobs API
        class Jobs
          ENTRY_POINT = 'api'
          
          # Init
          #
          # Arguments:
          #  client: (Client)
          def initialize(client)
            @client = client
            @client.epoint = ENTRY_POINT 
          end
          
          # Get list of jobs 
          #
          # Arguments:
          #  params: (Hash)
          def get_list(params)
            $LOG.i "running " + __method__.to_s
            @client.get '/hr/v2/jobs', params
          end
          
          # Get specific job by key
          #
          # Arguments:
          #  key: (String)
          def get_specific(key)
            $LOG.i "running " + __method__.to_s
            @client.get '/hr/v2/jobs/' + key
          end
          
          # Post a new job
          #
          # Arguments:
          #  params: (Hash)
          def post_job(params)
            $LOG.i "running " + __method__.to_s
            @client.post '/hr/v2/jobs', params
          end
          
          # Edit existent job
          #
          # Arguments:
          #  params: (Hash)
          def edit_job(key, params)
            $LOG.i "running " + __method__.to_s
            @client.put '/hr/v2/jobs/' + key, params
          end
          
          # Delete existent job
          #
          # Arguments:
          #  params: (Hash)
          def delete_job(key, params)
            $LOG.i "running " + __method__.to_s
            @client.delete '/hr/v2/jobs/' + key, params
          end
        end
      end
    end
  end
end