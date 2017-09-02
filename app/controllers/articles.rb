get "/" do
	@articles = HTTParty.get("http://localhost:3000/api/v1/articles", headers: {'Content-Type' => 'application/json',"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\""})
	@total = HTTParty.get("http://localhost:3000/api/v1/total_articles/2", headers: {"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\""})
	erb :'articles/index'
end

get "/new/article" do
	erb :'articles/new'	
end