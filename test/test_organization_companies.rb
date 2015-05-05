$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/organization/companies'
require 'test/unit'
require 'mocha/test_unit'

class OrganizationCompaniesTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_list
    api = Upwork::Api::Routers::Organization::Companies.new(get_client_mock)
    assert api.get_list
  end
  
  def test_get_specific
    api = Upwork::Api::Routers::Organization::Companies.new(get_client_mock)
    assert api.get_specific('12')
  end
  
  def test_get_teams
    api = Upwork::Api::Routers::Organization::Companies.new(get_client_mock)
    assert api.get_teams('12')
  end
  
  def test_get_users
    api = Upwork::Api::Routers::Organization::Companies.new(get_client_mock)
    assert api.get_users('12')
  end
end