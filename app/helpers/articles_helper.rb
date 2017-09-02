helpers do

  def total_articles(id_article)
    HTTParty.get("http://localhost:3000/api/v1/total_articles/#{id_article}", headers: {"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\""})
	end

end