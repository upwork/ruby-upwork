$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/snapshot'
require 'test/unit'
require 'mocha/test_unit'

class SnapshotTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_by_contract
    api = Upwork::Api::Routers::Snapshot.new(get_client_mock)
    assert api.get_by_contract('contract', '20140101')
  end
  
  def test_update_by_contract
    api = Upwork::Api::Routers::Snapshot.new(get_client_mock)
    assert api.update_by_contract('contract', '20140101', {})
  end
    
  def test_delete_by_contract
    api = Upwork::Api::Routers::Snapshot.new(get_client_mock)
    assert api.delete_by_contract('contract', '20140101')
  end
end
