require 'slack-notify'
require 'clockwork'
require 'active_support/time'
require 'dotenv'
Dotenv.load

module Clockwork
  client = SlackNotify::Client.new(
    webhook_url: ENV['WEBHOOK_URL'],
    channel: '#dev-slack',
    username: 'mybot',
    #icon_url: '',
    #icon_emoji: ':shipit:',
    #link_names: 1
  )
  handler do |job|
    client.notify("Hello There!")
  end
  every(3.minutes, 'frequent.job')
end
