$:.unshift 'lib'

require 'upwork/api'

$LOG = Upwork::Api::Logger.new

module TestHelper
  def get_client_mock    
    config = Upwork::Api::Config.new({
      'consumer_key'    => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      'consumer_secret' => 'xxxxxxxxxxxxxxxx',
      'access_token'    => 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
      'access_secret'   => 'xxxxxxxxxxxxxxxx',
      'debug'           => false
    })
    
    client = Upwork::Api::Client.new(config)
    client.expects(:send_request).returns(true)
    client
  end
end