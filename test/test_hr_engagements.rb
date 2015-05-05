$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/hr/engagements'
require 'test/unit'
require 'mocha/test_unit'

class HrEngagementsTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_list
    api = Upwork::Api::Routers::Hr::Engagements.new(get_client_mock)
    assert api.get_list({})
  end
  
  def test_get_specific
    api = Upwork::Api::Routers::Hr::Engagements.new(get_client_mock)
    assert api.get_specific('12')
  end
end