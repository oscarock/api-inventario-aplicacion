get "/movements" do
	@movements = HTTParty.get("http://localhost:3000/api/v1/movements", headers: {'Content-Type' => 'application/json',"Authorization" => "Token token=\"GNwqAsap2omwigQyuLQQnToG\""})
	erb :'movements/index'
end