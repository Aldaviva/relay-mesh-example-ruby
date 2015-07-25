require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'json'

get '/:ipAddress/callactive' do
  puts "Received callactive request", JSON.pretty_generate({
         ipAddress: params['ipAddress'],
         port: params['port'],
         name: params['name']
       })

  content_type :json
  { :callActive => false }.to_json
end

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
