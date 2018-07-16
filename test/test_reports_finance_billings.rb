$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/reports/finance/billings'
require 'test/unit'
require 'mocha/test_unit'

class ReportsFinanceBillingsTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_by_freelancer
    api = Upwork::Api::Routers::Reports::Finance::Billings.new(get_client_mock)
    assert api.get_by_freelancer('12', {})
  end
  
  def test_get_by_buyers_team
    api = Upwork::Api::Routers::Reports::Finance::Billings.new(get_client_mock)
    assert api.get_by_buyers_team('12', {})
  end
  
  def test_get_by_buyers_company
    api = Upwork::Api::Routers::Reports::Finance::Billings.new(get_client_mock)
    assert api.get_by_buyers_company('12', {})
  end
end
