$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/mc'
require 'test/unit'
require 'mocha/test_unit'

class McTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_trays
    api = Upwork::Api::Routers::Mc.new(get_client_mock)
    assert api.get_trays
  end
  
  def test_get_tray_by_type
    api = Upwork::Api::Routers::Mc.new(get_client_mock)
    assert api.get_tray_by_type('username', 'type')
  end
  
  def test_get_thread_details
    api = Upwork::Api::Routers::Mc.new(get_client_mock)
    assert api.get_thread_details('username', '12')
  end
  
  def test_get_thread_by_context
    api = Upwork::Api::Routers::Mc.new(get_client_mock)
    assert api.get_thread_by_context('username', '~key', '12')
  end
  
  def test_get_thread_by_context_last_posts
    api = Upwork::Api::Routers::Mc.new(get_client_mock)
    assert api.get_thread_by_context_last_posts('username', '~key', '12')
  end
  
  def test_start_new_thread
    api = Upwork::Api::Routers::Mc.new(get_client_mock)
    assert api.start_new_thread('username', {})
  end
  
  def test_reply_to_thread
    api = Upwork::Api::Routers::Mc.new(get_client_mock)
    assert api.reply_to_thread('username', '12', {})
  end
  
  def test_mark_thread
    api = Upwork::Api::Routers::Mc.new(get_client_mock)
    assert api.mark_thread('username', '12', {})
  end
end
