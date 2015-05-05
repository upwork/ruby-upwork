$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/auth'
require 'test/unit'
require 'mocha/test_unit'

class AuthTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_user_info
    api = Upwork::Api::Routers::Auth.new(get_client_mock)
    assert api.get_user_info
  end
end