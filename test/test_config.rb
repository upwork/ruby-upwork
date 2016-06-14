$:.unshift 'lib'

require 'upwork/api/config'
require 'test/unit'
require 'mocha/test_unit'

class ConfigTest < Test::Unit::TestCase
  def test_my_config_initialization
    config = Upwork::Api::Config.new({
      'consumer_key'    => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      'consumer_secret' => 'xxxxxxxxxxxxxxxx',
      'access_token'    => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      'access_secret'   => 'xxxxxxxxxxxxxxxx',
      'signature_method'=> 'sig',
      'debug'           => false
    })
    
    assert_equal 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',config.consumer_key
    assert_equal 'xxxxxxxxxxxxxxxx',config.consumer_secret
    assert_equal 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',config.access_token
    assert_equal 'xxxxxxxxxxxxxxxx',config.access_secret
    assert_equal 'sig',config.signature_method
    assert_equal false,config.debug
  end
end
