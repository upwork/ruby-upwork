$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/metadata'
require 'test/unit'
require 'mocha/test_unit'

class MetadataTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_tests
    api = Upwork::Api::Routers::Metadata.new(get_client_mock)
    assert api.get_tests
  end
  
  def test_get_regions
    api = Upwork::Api::Routers::Metadata.new(get_client_mock)
    assert api.get_regions
  end
    
  def test_get_skills
    api = Upwork::Api::Routers::Metadata.new(get_client_mock)
    assert api.get_skills
  end
    
  def test_get_categories
    api = Upwork::Api::Routers::Metadata.new(get_client_mock)
    assert api.get_categories
  end
    
  def test_get_categories_v2
    api = Upwork::Api::Routers::Metadata.new(get_client_mock)
    assert api.get_categories_v2
  end
    
  def test_get_reasons
    api = Upwork::Api::Routers::Metadata.new(get_client_mock)
    assert api.get_reasons({})
  end
end
