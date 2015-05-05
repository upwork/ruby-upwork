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

require 'oauth'

require 'upwork/api/version'
require 'upwork/api/logger'
require 'upwork/api/config'
require 'upwork/api/client'

module Upwork # :nodoc:
  module Api
    # define some constants
    BASE_HOST       = 'https://www.upwork.com'
    DEFAULT_EPOINT  = 'api'
    
    $LOG = Logger.new
  end
end