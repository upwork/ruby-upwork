$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/jobs/search'
require 'test/unit'
require 'mocha/test_unit'

class JobsSearchTest < Test::Unit::TestCase
  include TestHelper
  
  def test_find
    api = Upwork::Api::Routers::Jobs::Search.new(get_client_mock)
    assert api.find({})
  end
end