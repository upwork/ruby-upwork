$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/hr/clients/offers'
require 'test/unit'
require 'mocha/test_unit'

class HrClientsOffersTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_list
    api = Upwork::Api::Routers::Hr::Clients::Offers.new(get_client_mock)
    assert api.get_list({})
  end
  
  def test_get_specific
    api = Upwork::Api::Routers::Hr::Clients::Offers.new(get_client_mock)
    assert api.get_specific('12', {})
  end
  
  def test_make_offer
    api = Upwork::Api::Routers::Hr::Clients::Offers.new(get_client_mock)
    assert api.make_offer({})
  end
end
