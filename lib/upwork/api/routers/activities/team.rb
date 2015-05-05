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
      module Activities
        # Team Activities
        class Team
          ENTRY_POINT = 'api'

          # Init
          #
          # Arguments:
          #  client: (Client)
          def initialize(client)
            @client = client
            @client.epoint = ENTRY_POINT
          end

          # List all oTask/Activity records within a team
          #
          # Arguments:
          #  company: (String)
          #  team: (String)
          def get_list(company, team)
            get_by_type company, team, nil
          end

          # List all oTask/Activity records within a Company by specified code(s)
          #
          # Arguments:
          #  company: (String)
          #  team: (String)
          #  code: (String)
          def get_specific_list(company, team, code)
            get_by_type company, team, code
          end

          # Create an oTask/Activity record within a team
          #
          # Arguments:
          #  company: (String)
          #  team: (String)
          #  params: (Hash)
          def add_activity(company, team, params)
            @client.post '/otask/v1/tasks/companies/' + company + '/' + team + '/tasks', params
          end

          # Update specific oTask/Activity record within a team
          #
          # Arguments:
          #  company: (String)
          #  team: (String)
          #  code: (String)
          #  params: (Hash)
          def update_activities(company, team, code, params)
            @client.put '/otask/v1/tasks/companies/' + company + '/' + team + '/tasks/' + code, params
          end

          # Archive specific oTask/Activity record within a team
          #
          # Arguments:
          #  company: (String)
          #  team: (String)
          #  code: (String)
          def archive_activities(company, team, code)
            @client.put '/otask/v1/tasks/companies/' + company + '/' + team + '/archive/' + code
          end

          # Unarchive specific oTask/Activity record within a team
          #
          # Arguments:
          #  company: (String)
          #  team: (String)
          #  code: (String)
          def unarchive_activities(company, team, code)
            @client.put '/otask/v1/tasks/companies/' + company + '/' + team + '/unarchive/' + code
          end

          # Update a group of oTask/Activity records within a company
          #
          # Arguments:
          #  company: (String)
          #  params: (Hash)
          def update_batch(company, params)
            @client.put '/otask/v1/tasks/companies/' + company + '/tasks/batch', params
          end

          private

          # Get by type
          def get_by_type(company, team, code = nil)
            $LOG.i "running " + __method__.to_s
            url = '';
            if code != nil
                url = '/' + code;
            end

            @client.get '/otask/v1/tasks/companies/' + company + '/' + team + '/tasks' + url
          end

        end
      end
    end
  end
end
