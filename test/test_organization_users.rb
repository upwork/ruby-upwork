$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/organization/users'
require 'test/unit'
require 'mocha/test_unit'

class OrganizationUsersTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_my_info
    api = Upwork::Api::Routers::Organization::Users.new(get_client_mock)
    assert api.get_my_info
  end
  
  def test_get_specific
    api = Upwork::Api::Routers::Organization::Users.new(get_client_mock)
    assert api.get_specific('12')
  end
end
