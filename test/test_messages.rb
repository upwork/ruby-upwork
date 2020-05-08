$:.unshift 'lib'
$LOAD_PATH << File.dirname(__FILE__)

require 'helper'
require 'upwork/api/routers/messages'
require 'test/unit'
require 'mocha/test_unit'

class MessagesTest < Test::Unit::TestCase
  include TestHelper
  
  def test_get_rooms
    api = Upwork::Api::Routers::Messages.new(get_client_mock)
    assert api.get_rooms('company')
  end
  
  def test_get_room_details
    api = Upwork::Api::Routers::Messages.new(get_client_mock)
    assert api.get_room_details('company', 'room-id', {})
  end
  
  def test_get_room_messages
    api = Upwork::Api::Routers::Messages.new(get_client_mock)
    assert api.get_room_messages('company', 'room-id', {})
  end
  
  def test_get_room_by_offer
    api = Upwork::Api::Routers::Messages.new(get_client_mock)
    assert api.get_room_by_offer('company', '1234', {})
  end
  
  def test_get_room_by_application
    api = Upwork::Api::Routers::Messages.new(get_client_mock)
    assert api.get_room_by_application('company', '1234', {})
  end
  
  def test_get_room_by_contract
    api = Upwork::Api::Routers::Messages.new(get_client_mock)
    assert api.get_room_by_contract('company', '1234', {})
  end
  
  def test_create_room
    api = Upwork::Api::Routers::Messages.new(get_client_mock)
    assert api.create_room('company', {})
  end
  
  def test_send_message_to_room
    api = Upwork::Api::Routers::Messages.new(get_client_mock)
    assert api.send_message_to_room('company', 'room-id', {})
  end
  
  def test_update_room_settings
    api = Upwork::Api::Routers::Messages.new(get_client_mock)
    assert api.update_room_settings('company', 'room-id', 'username', {})
  end
  
  def test_update_room_metadata
    api = Upwork::Api::Routers::Messages.new(get_client_mock)
    assert api.update_room_metadata('company', 'room-id', {})
  end
end
