base_uri = "https://inventario-api.herokuapp.com/api/v1"
token_user = "3r4oKacKhajSMQx7E1nxAnWK"

get "/movements" do
	@movements = HTTParty.get("#{base_uri}/movements", headers: {'Content-Type' => 'application/json',"Authorization" => "Token token=\"#{token_user}\""})
	erb :'movements/index'
end

get "/new/movements" do
	@articles = HTTParty.get("#{base_uri}/articles", headers: {'Content-Type' => 'application/json',"Authorization" => "Token token=\"#{token_user}\""})
	erb :'movements/new'	
end

post "/movements" do
	movements = HTTParty.post("#{base_uri}/movements", body: { movement_type_id: params['movement_type_id'], article_id: params['article_id'], amount: params['amount']}.to_json, headers: {"Authorization" => "Token token=\"#{token_user}\"", 'Content-Type' => 'application/json' })
	redirect "/"
end

get "/edit/movement/:id" do
	@articles = HTTParty.get("#{base_uri}/articles", headers: {'Content-Type' => 'application/json',"Authorization" => "Token token=\"#{token_user}\""})
	@movement = HTTParty.get("#{base_uri}/movements/#{params[:id]}", headers: {"Authorization" => "Token token=\"#{token_user}\""})
	erb :'movements/edit'
end

patch "/movement/:id" do
	@movement = HTTParty.patch("#{base_uri}/movements/#{params[:id]}", body: { movement_type_id: params['movement_type_id'], article_id: params['article_id'], amount: params['amount']}.to_json, headers: {"Authorization" => "Token token=\"#{token_user}\"", 'Content-Type' => 'application/json' })
	redirect "/"
end