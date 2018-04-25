class Ahoy::Store < Ahoy::DatabaseStore
   Ahoy.api = true
   Ahoy.server_side_visits = false

  def visit_model
    Visit
  end
end
