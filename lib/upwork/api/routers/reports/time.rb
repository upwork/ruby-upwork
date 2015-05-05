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
        # Time reports
        class Time
          ENTRY_POINT = 'gds'
          
          # Init
          #
          # Arguments:
          #  client: (Client)
          def initialize(client)
            @client = client
            @client.epoint = ENTRY_POINT 
          end
          
          # Generate Time Reports for a Specific Team (with financial info)
          #
          # Arguments:
          #  company: (String)
          #  team: (String)
          #  params: (Hash)
          def get_by_team_full(company, team, params)
            $LOG.i "running " + __method__.to_s
            get_by_type(company, team, nil, params, false)
          end
          
          # Generate Time Reports for a Specific Team (hide financial info)
          #
          # Arguments:
          #  company: (String)
          #  team: (String)
          #  params: (Hash)
          def get_by_team_limited(company, team, params)
            $LOG.i "running " + __method__.to_s
            get_by_type(company, team, nil, params, true)
          end
          
          # Generating Agency Specific Reports
          #
          # Arguments:
          #  company: (String)
          #  agency: (String)
          #  params: (Hash)
          def get_by_agency(company, agency, params)
            $LOG.i "running " + __method__.to_s
            get_by_type(company, nil, agency, params, false)
          end
          
          # Generating Company Wide Reports
          #
          # Arguments:
          #  company: (String)
          #  params: (Hash)
          def get_by_company(company, params)
            $LOG.i "running " + __method__.to_s
            get_by_type(company, nil, nil, params, false)
          end
          
          # Generating Freelancer's Specific Reports (hide financial info)
          #
          # Arguments:
          #  freelancer_id: (String)
          #  params: (Hash)
          def get_by_freelancer_limited(freelancer_id, params)
            $LOG.i "running " + __method__.to_s
            @client.get '/timereports/v1/providers/' + freelancer_id, params
          end
          
          # Generating Freelancer's Specific Reports (with financial info)
          #
          # Arguments:
          #  freelancer_id: (String)
          #  params: (Hash)
          def get_by_freelancer_full(freelancer_id, params)
            $LOG.i "running " + __method__.to_s
            @client.get '/timereports/v1/providers/' + freelancer_id, params
          end
          
          private
          
          def get_by_type(company, team, agency, params, hide_fin_data)
            $LOG.i "running " + __method__.to_s
            url = '';
            if (team != nil)
                url = '/teams/' + team;
                if (hide_fin_data)
                    url = url + '/hours';
                end
            elsif (agency != nil)
                url = '/agencies/' + agency
            end
    
            @client.get '/timereports/v1/companies/' + company + url, params
          end
        end
      end
    end
  end
end