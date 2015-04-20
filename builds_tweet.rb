class BuildsTweet

  def tweet(quote_data)
    quote_with_url = [quote_data.quote, quote_data.article_url].join(" ")
    post  = client.update_with_media quote_with_url, File.new(quote_data.file_path)
    tweet = client.status post.id
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY")
      config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET")
      config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("TWITTER_ACCESS_TOKEN_SECRET")
    end
  end
end
