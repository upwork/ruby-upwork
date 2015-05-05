$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/freelancers/profile'
require 'test/unit'
require 'mocha/test_unit'

class FreelancersProfileTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_specific
    api = Upwork::Api::Routers::Freelancers::Profile.new(get_client_mock)
    assert api.get_specific('~key')
  end

  def test_get_specific_brief
    api = Upwork::Api::Routers::Freelancers::Profile.new(get_client_mock)
    assert api.get_specific_brief('~key')
  end

end
