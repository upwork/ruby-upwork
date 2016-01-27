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
      class Mc
        ENTRY_POINT = 'api'
        
        # Init
        #
        # Arguments:
        #  client: (Client)
        def initialize(client)
          @client = client
          @client.epoint = ENTRY_POINT 
        end
        
        # Get trays
        def get_trays
          $LOG.i "running " + __method__.to_s
          @client.get '/mc/v1/trays'
        end
        
        # Get tray by type
        #
        # Arguments:
        #  username: (String)
        #  type: (String)
        def get_tray_by_type(username, type, params = {})
          $LOG.i "running " + __method__.to_s
          @client.get '/mc/v1/trays/' + username + '/' + type, params
        end
        
        # List thread details based on thread id
        #
        # Arguments:
        #  username: (String)
        #  thread_id: (String)
        def get_thread_details(username, thread_id)
          $LOG.i "running " + __method__.to_s
          @client.get '/mc/v1/threads/' + username + '/' + thread_id
        end
        
        # Get a specific thread by context
        #
        # Arguments:
        #  username: (String)
        #  job_key: (String)
        #  application_id: (String)
        #  context: (String)
        def get_thread_by_context(username, job_key, application_id, context = 'Interviews')
          $LOG.i "running " + __method__.to_s
          @client.get '/mc/v1/contexts/' + username + '/' + context + ':' + job_key + ':' + application_id
        end
        
        # Get a specific thread by context (last message content)
        #
        # Arguments:
        #  username: (String)
        #  job_key: (String)
        #  application_id: (String)
        #  context: (String)
        def get_thread_by_context_last_posts(username, job_key, application_id, context = 'Interviews')
          $LOG.i "running " + __method__.to_s
          @client.get '/mc/v1/contexts/' + username + '/' + context + ':' + job_key + ':' + application_id + '/last_posts'
        end
        
        # Send new message
        #
        # Arguments:
        #  username: (String)
        #  params: (Hash)
        def start_new_thread(username, params = {})
          $LOG.i "running " + __method__.to_s
          @client.post '/mc/v1/threads/' + username, params
        end
        
        # Reply to existent thread
        #
        # Arguments:
        #  username: (String)
        #  thread_id: (String)
        #  params: (Hash)
        def reply_to_thread(username, thread_id, params = {})
          $LOG.i "running " + __method__.to_s
          @client.post '/mc/v1/threads/' + username + '/' + thread_id, params
        end
        
        # Update threads based on user actions
        #
        # Arguments:
        #  username: (String)
        #  thread_id: (String)
        #  params: (Hash)
        def mark_thread(username, thread_id, params = {})
          $LOG.i "running " + __method__.to_s
          @client.put '/mc/v1/threads/' + username + '/' + thread_id, params
        end
      end
    end
  end
end
