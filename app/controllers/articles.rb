base_uri = "https://inventario-api.herokuapp.com/api/v1"
token_user = "3r4oKacKhajSMQx7E1nxAnWK"

get "/" do
	@articles = HTTParty.get("#{base_uri}/articles", headers: {'Content-Type' => 'application/json',"Authorization" => "Token token=\"#{token_user}\""})
	erb :'articles/index'
end

get "/new/article" do
	erb :'articles/new'	
end

post "/articles" do
	article = HTTParty.post("#{base_uri}/articles", body: { image_url: params['image_url']  ,code: params['code'], description: params['description']}.to_json, headers: {"Authorization" => "Token token=\"#{token_user}\"", 'Content-Type' => 'application/json' })
	redirect "/"
end

get "/edit/article/:id" do
	@article = HTTParty.get("#{base_uri}/articles/#{params[:id]}", headers: {"Authorization" => "Token token=\"#{token_user}\""})
	erb :'articles/edit'
end

patch "/article/:id" do
	@article = HTTParty.patch("#{base_uri}/articles/#{params[:id]}", body: { image_url: params['image_url']  ,code: params['code'], description: params['description']}.to_json, headers: {"Authorization" => "Token token=\"#{token_user}\"", 'Content-Type' => 'application/json' })
	redirect "/"
end

delete "/delete/article/:id" do
	@article = HTTParty.delete("#{base_uri}/articles/#{params[:id]}", headers: {"Authorization" => "Token token=\"#{token_user}\""})
	redirect "/"
end	


 