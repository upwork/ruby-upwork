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
        # Submissions workflow
        class Submissions
          ENTRY_POINT = 'api'
          
          # Init
          #
          # Arguments:
          #  client: (Client)
          def initialize(client)
            @client = client
            @client.epoint = ENTRY_POINT 
          end
          
          # Freelancer submits work for the client to approve
          #
          # Arguments:
          #  params: (Hash)
          def request_approval(params)
            $LOG.i "running " + __method__.to_s
            @client.post '/hr/v3/fp/submissions', params
          end
          
          # Approve an existing Submission
          #
          # Arguments:
          #  submission_id: (String)
          #  params: (Hash)
          def approve(submission_id, params)
            $LOG.i "running " + __method__.to_s
            @client.put '/hr/v3/fp/submissions/' + submission_id + '/approve', params
          end
          
          # Reject an existing Submission
          #
          # Arguments:
          #  submission_id: (String)
          #  params: (Hash)
          def reject(submission_id, params)
            $LOG.i "running " + __method__.to_s
            @client.put '/hr/v3/fp/submissions/' + submission_id + '/reject', params
          end
        end
      end
    end
  end
end
