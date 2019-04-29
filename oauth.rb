# encoding: UTF-8
# spaces:2
# based on https://pragtob.wordpress.com/2011/09/09/oauth-out-of-bandpin-authentication-with-ruby/

require 'oauth'

consumer_key = 'OAUTH_CONSUMER_TOKEN_HERE'
consumer_secret = 'OAUTH_CONSUMER_SECRET_HERE'
consumer = OAuth::Consumer.new(consumer_key, consumer_secret, :site => 'https://api.twitter.com')
request_token = consumer.get_request_token

puts "Use this URL: #{request_token.authorize_url}"
puts ' to grab OAuth credentials. Enter the PIN: '
pincode = (gets.chomp).to_i

# last step of the authentication
access_token = request_token.get_access_token(:oauth_verifier => pincode)

puts "User OAuth token: #{access_token.token}"
puts "User OAuth secret: #{access_token.secret}"
