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
# Copyright:: Copyright 2016(c) Upwork.com
# License::   See LICENSE.txt and TOS - https://developers.upwork.com/api-tos.html

module Upwork
  module Api
    module Routers
      class Messages
        ENTRY_POINT = 'api'
        
        # Init
        #
        # Arguments:
        #  client: (Client)
        def initialize(client)
          @client = client
          @client.epoint = ENTRY_POINT 
        end
        
        # Retrieve rooms information
        #
        # Arguments:
        #  company: (String)
        #  params: (Hash)
        def get_rooms(company, params = {})
          $LOG.i "running " + __method__.to_s
          @client.get '/messages/v3/' + company + '/rooms', params
        end
        
        # Get a specific room information
        #
        # Arguments:
        #  company: (String)
	#  room_id: (String)
        #  params: (Hash)
        def get_room_details(company, room_id, params = {})
          $LOG.i "running " + __method__.to_s
          @client.get '/messages/v3/' + company + '/rooms/' + room_id, params
        end
        
        # Get messages from a specific room
        #
        # Arguments:
        #  company: (String)
	#  room_id: (String)
        #  params: (Hash)
        def get_room_messages(company, room_id, params = {})
          $LOG.i "running " + __method__.to_s
          @client.get '/messages/v3/' + company + '/rooms/' + room_id + '/stories', params
        end
        
        # Get a specific room by offer ID
        #
        # Arguments:
        #  company: (String)
	#  offer_id: (String)
        #  params: (Hash)
        def get_room_by_offer(company, offer_id, params = {})
          $LOG.i "running " + __method__.to_s
          @client.get '/messages/v3/' + company + '/rooms/offers/' + offer_id, params
        end
        
        # Get a specific room by application ID
        #
        # Arguments:
        #  company: (String)
	#  application_id: (String)
        #  params: (Hash)
        def get_room_by_application(company, application_id, params = {})
          $LOG.i "running " + __method__.to_s
          @client.get '/messages/v3/' + company + '/rooms/applications/' + application_id, params
        end
        
        # Get a specific room by contract ID
        #
        # Arguments:
        #  company: (String)
	#  contract_id: (String)
        #  params: (Hash)
        def get_room_by_contract(company, contract_id, params = {})
          $LOG.i "running " + __method__.to_s
          @client.get '/messages/v3/' + company + '/rooms/contracts/' + contract_id, params
        end
        
        # Create a new room
        #
        # Arguments:
        #  company: (String)
        #  params: (Hash)
        def create_room(company, params = {})
          $LOG.i "running " + __method__.to_s
          @client.post '/messages/v3/' + company + '/rooms', params
        end

        # Send a message to a room
        #
        # Arguments:
        #  company: (String)
	#  room_id: (String)
        #  params: (Hash)
        def send_message_to_room(company, room_id, params = {})
          $LOG.i "running " + __method__.to_s
          @client.post '/messages/v3/' + company + '/rooms/' + room_id + '/stories', params
        end

        # Update a room settings
        #
        # Arguments:
        #  company: (String)
	#  room_id: (String)
	#  username: (String)
        #  params: (Hash)
        def update_room_settings(company, room_id, username, params = {})
          $LOG.i "running " + __method__.to_s
          @client.put '/messages/v3/' + company + '/rooms/' + room_id + '/users/' + username, params
        end
        
        # Update the metadata of a room
        #
        # Arguments:
        #  company: (String)
	#  room_id: (String)
        #  params: (Hash)
        def update_room_metadata(company, room_id, params = {})
          $LOG.i "running " + __method__.to_s
          @client.put '/messages/v3/' + company + '/rooms/' + room_id, params
        end
      end
    end
  end
end
