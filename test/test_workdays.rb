$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/workdays'
require 'test/unit'
require 'mocha/test_unit'

class WorkdaysTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_by_company
    api = Upwork::Api::Routers::Workdays.new(get_client_mock)
    assert api.get_by_company('company', '20140101', '20140131', {})
  end
  
  def test_get_by_contract
    api = Upwork::Api::Routers::Workdays.new(get_client_mock)
    assert api.get_by_contract('1234', '20140101', '20140131', {})
  end
end
