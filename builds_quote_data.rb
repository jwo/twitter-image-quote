require 'uri'
class BuildsQuoteData

  def self.build
    data = QuoteData.new
    puts "What's the quote?"
    quote = gets.gsub('\'', '\\\'').chomp.strip

    while quote.length > 100
      puts ""
      puts "--!!!!!!!---"
      puts "The quote is too long. With a url and photo, you have 93 available. You are using #{quote.length}. Try Again."
      puts "--!!!!!!!---"
      puts ""
      quote = gets.gsub('\'', '\\\'').chomp.strip
    end


    puts "What's the article URL?"
    article_url = gets.chomp
    puts "What's the filepath to the image?"
    file_path = gets.chomp

    data.quote = quote
    data.article_url = URI.parse(article_url)
    data.file_path = file_path

    data

  end

end
