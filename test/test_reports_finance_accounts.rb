$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/reports/finance/accounts'
require 'test/unit'
require 'mocha/test_unit'

class ReportsFinanceAccountsTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_owned
    api = Upwork::Api::Routers::Reports::Finance::Accounts.new(get_client_mock)
    assert api.get_owned('12', {})
  end
  
  def test_get_specific
    api = Upwork::Api::Routers::Reports::Finance::Accounts.new(get_client_mock)
    assert api.get_specific('12', {})
  end
end