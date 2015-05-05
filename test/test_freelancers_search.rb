$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/freelancers/search'
require 'test/unit'
require 'mocha/test_unit'

class FreelancersSearchTest < Test::Unit::TestCase
  include TestHelper
  
  def test_find
    api = Upwork::Api::Routers::Freelancers::Search.new(get_client_mock)
    assert api.find({})
  end
end