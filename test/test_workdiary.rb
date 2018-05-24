$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/workdiary'
require 'test/unit'
require 'mocha/test_unit'

class WorkdiaryTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get
    api = Upwork::Api::Routers::Workdiary.new(get_client_mock)
    assert api.get('company', '20140101', {})
  end
  
  def test_get_by_contract
    api = Upwork::Api::Routers::Workdiary.new(get_client_mock)
    assert api.get_by_contract('1234', '20140101', {})
  end
end
