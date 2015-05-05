$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/organization/teams'
require 'test/unit'
require 'mocha/test_unit'

class OrganizationTeamsTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_list
    api = Upwork::Api::Routers::Organization::Teams.new(get_client_mock)
    assert api.get_list
  end
  
  def test_get_users_in_team
    api = Upwork::Api::Routers::Organization::Teams.new(get_client_mock)
    assert api.get_users_in_team('12')
  end
end