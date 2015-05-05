$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/hr/roles'
require 'test/unit'
require 'mocha/test_unit'

class HrRolesTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_all
    api = Upwork::Api::Routers::Hr::Roles.new(get_client_mock)
    assert api.get_all
  end
  
  def test_get_by_specific_user
    api = Upwork::Api::Routers::Hr::Roles.new(get_client_mock)
    assert api.get_by_specific_user('12')
  end
end