class BuildsUrl

  def build(tweet:, quote_data:)
    base << [CGI.escape(quote_data.quote), quote_data.article_url, extract_photo_url_from_tweet(tweet)].join("+")
  end

  def extract_photo_url_from_tweet(tweet)
    photo_url = tweet.media.first.display_uri
    photo_url = "http://" + photo_url unless photo_url.start_with? "http"
    photo_url
  end

  def base
    "https://twitter.com/intent/tweet?text="
  end
end
