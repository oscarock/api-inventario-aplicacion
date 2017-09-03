get "/" do
	@articles = HTTParty.get("http://localhost:3000/api/v1/articles", headers: {'Content-Type' => 'application/json',"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\""})
	erb :'articles/index'
end

get "/new/article" do
	erb :'articles/new'	
end

post "/articles" do
	article = HTTParty.post('http://localhost:3000/api/v1/articles', body: { image_url: params['image_url']  ,code: params['code'], description: params['description']}.to_json, headers: {"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\"", 'Content-Type' => 'application/json' })
	redirect "/"
end

get "/edit/article/:id" do
	@article = HTTParty.get("http://localhost:3000/api/v1/articles/#{params[:id]}", headers: {"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\""})
	erb :'articles/edit'
end

patch "/article/:id" do
	@article = HTTParty.patch("http://localhost:3000/api/v1/articles/#{params[:id]}", body: { image_url: params['image_url']  ,code: params['code'], description: params['description']}.to_json, headers: {"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\"", 'Content-Type' => 'application/json' })
	redirect "/"
end

delete "/delete/article/:id" do
	@article = HTTParty.delete("http://localhost:3000/api/v1/articles/#{params[:id]}", headers: {"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\""})
	redirect "/"
end	


 