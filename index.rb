require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'json'

# Capabilities method
# see https://relay.bluejeans.com/docs/mesh.html#capabilities
get '/:ipAddress/capabilities' do
  puts "Received capabilities request", JSON.pretty_generate({
         ipAddress: params['ipAddress'],
         port: params['port'],
         name: params['name']
       })

  content_type :json
  { :JOIN => true, 
    :HANGUP => true,
    :STATUS => true,
    :MUTE_MICROPHONE => true }.to_json
end

# Status method
# see https://relay.bluejeans.com/docs/mesh.html#status
get '/:ipAddress/status' do
  puts "Received status request", JSON.pretty_generate({
         ipAddress: params['ipAddress'],
         port: params['port'],
         name: params['name']
       })

  content_type :json
  { :callActive => false, 
    :microphoneMuted => false }.to_json
end

# Join method
# see https://relay.bluejeans.com/docs/mesh.html#join
post '/:ipAddress/join' do
  puts "Received join request", JSON.pretty_generate({
         ipAddress: params['ipAddress'],
         dialString: params['dialString'],
         meetingId: params['meetingId'],
         passcode: params['passcode'],
         bridgeAddress: params['bridgeAddress'],
         endpoint: JSON.parse(request.body.read())
       })

  204
end

# Mute Microphone method
# see https://relay.bluejeans.com/docs/mesh.html#mutemicrophone
post '/:ipAddress/mutemicrophone' do
  puts "Received mutemicrophone request", JSON.pretty_generate({
         ipAddress: params['ipAddress'],
         endpoint: JSON.parse(request.body.read())
       })

  204
end

# Unmute Microphone method
# see https://relay.bluejeans.com/docs/mesh.html#mutemicrophone
post '/:ipAddress/unmutemicrophone' do
  puts "Received unmutemicrophone request", JSON.pretty_generate({
         ipAddress: params['ipAddress'],
         endpoint: JSON.parse(request.body.read())
       })

  204
end

# Hangup method
# see https://relay.bluejeans.com/docs/mesh.html#hangup
post '/:ipAddress/hangup' do
  puts "Received hangup request", JSON.pretty_generate({
         ipAddress: params['ipAddress'],
         endpoint: JSON.parse(request.body.read())
       })

  204
end

configure do
  set :port, 6374
  set :bind, '0.0.0.0'
end
