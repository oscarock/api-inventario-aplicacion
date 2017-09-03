get "/movements" do
	@movements = HTTParty.get("http://localhost:3000/api/v1/movements", headers: {'Content-Type' => 'application/json',"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\""})
	erb :'movements/index'
end

get "/new/movements" do
	@articles = HTTParty.get("http://localhost:3000/api/v1/articles", headers: {'Content-Type' => 'application/json',"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\""})
	erb :'movements/new'	
end

post "/movements" do
	movements = HTTParty.post('http://localhost:3000/api/v1/movements', body: { movement_type_id: params['movement_type_id'], article_id: params['article_id'], amount: params['amount']}.to_json, headers: {"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\"", 'Content-Type' => 'application/json' })
	redirect "/"
end

get "/edit/movement/:id" do
	@articles = HTTParty.get("http://localhost:3000/api/v1/articles", headers: {'Content-Type' => 'application/json',"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\""})
	@movement = HTTParty.get("http://localhost:3000/api/v1/movements/#{params[:id]}", headers: {"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\""})
	erb :'movements/edit'
end

patch "/movement/:id" do
	@movement = HTTParty.patch("http://localhost:3000/api/v1/movements/#{params[:id]}", body: { movement_type_id: params['movement_type_id'], article_id: params['article_id'], amount: params['amount']}.to_json, headers: {"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\"", 'Content-Type' => 'application/json' })
	redirect "/"
end