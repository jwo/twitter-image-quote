class RebuildUrl

  attr_accessor :id, :url, :quote


  def rebuild
    raise unless id
    raise unless url
    raise unless quote

    client = BuildsTweet.new.client
    tweet = client.status id

    data = QuoteData.new
    data.article_url = self.url
    data.quote = self.quote

    url = BuildsUrl.new.build(tweet: tweet, quote_data: data)

  end
end
