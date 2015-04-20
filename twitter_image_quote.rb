require 'bundler'
Bundler.require
Dotenv.load
require 'cgi'
require './quote_data'
require './builds_quote_data'
require './builds_tweet'
require './builds_url'
require './rebuild_url'

quote_data = BuildsQuoteData.build
tweet = BuildsTweet.new.tweet(quote_data)
puts BuildsUrl.new.build(tweet: tweet, quote_data: quote_data)

