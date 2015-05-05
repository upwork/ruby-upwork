$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/activities/team'
require 'test/unit'
require 'mocha/test_unit'

class ActivitiesTeamTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_list
    api = Upwork::Api::Routers::Activities::Team.new(get_client_mock)
    assert api.get_list('company', 'team')
  end
  
  def test_get_specific_list
    api = Upwork::Api::Routers::Activities::Team.new(get_client_mock)
    assert api.get_specific_list('company', 'team', 'code')
  end
    
  def test_add_activity
    api = Upwork::Api::Routers::Activities::Team.new(get_client_mock)
    assert api.add_activity('company', 'team', {})
  end
    
  def test_update_activities
    api = Upwork::Api::Routers::Activities::Team.new(get_client_mock)
    assert api.update_activities('company', 'team', 'code', {})
  end
    
  def test_archive_activities
    api = Upwork::Api::Routers::Activities::Team.new(get_client_mock)
    assert api.archive_activities('company', 'team', 'code')
  end
    
  def test_unarchive_activities
    api = Upwork::Api::Routers::Activities::Team.new(get_client_mock)
    assert api.unarchive_activities('company', 'team', 'code')
  end

  def test_update_batch
    api = Upwork::Api::Routers::Activities::Team.new(get_client_mock)
    assert api.update_batch('company', 'data')
  end
end
