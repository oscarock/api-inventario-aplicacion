helpers do
  def total_articles(id_article)
  	base_uri = "https://inventario-api.herokuapp.com/api/v1"
	token_user = "3r4oKacKhajSMQx7E1nxAnWK"

    HTTParty.get("#{base_uri}/total_articles/#{id_article}", headers: {"Authorization" => "Token token=\"#{token_user}\""})
	end

end