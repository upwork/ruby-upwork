$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/payments'
require 'test/unit'
require 'mocha/test_unit'

class PaymentsTest < Test::Unit::TestCase
  include TestHelper
  
  def test_submit_bonus
    api = Upwork::Api::Routers::Payments.new(get_client_mock)
    assert api.submit_bonus('12', {})
  end
end
