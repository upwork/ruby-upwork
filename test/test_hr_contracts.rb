$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/hr/contracts'
require 'test/unit'
require 'mocha/test_unit'

class HrContractsTest < Test::Unit::TestCase
  include TestHelper
  
  def test_suspend_contract
    api = Upwork::Api::Routers::Hr::Contracts.new(get_client_mock)
    assert api.suspend_contract('12', {})
  end
  
  def test_restart_contract
    api = Upwork::Api::Routers::Hr::Contracts.new(get_client_mock)
    assert api.restart_contract('12', {})
  end
  
  def test_end_contract
    api = Upwork::Api::Routers::Hr::Contracts.new(get_client_mock)
    assert api.end_contract('12', {})
  end
end
