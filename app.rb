require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Random Results</h1>
  "
end

# Square
get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num**2
  erb(:square_results)
end

# square root
get("/square_root/new") do 
erb(:root_new)
end

get("/square_root/results") do
  @the_num = params.fetch("user_number").to_f
  @the_result = @the_num**0.5
  erb(:root_result)
end

# payment
get("/payment/new") do 
  erb(:payment_new)
  end
  
  get("/payment/results") do
    @APR_new = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_f
    @principal = params.fetch("user_principal").to_f
    @APR_pct = @APR_new/(100*12)
    @months = @years*12
    @payment_raw = @APR_pct*@principal/(1-(1+@APR_pct)**(@months*-1))
    @payment = format("%.2f",  @payment_raw.round(2)) #@payment_raw.round(2)
    @APR = format("%.4f", @APR_new.round(4))
    @years_vis = @years.round(0)
    @principal_vis = format("%.2f", @principal.round(2))
    erb(:payment_results)
  end

  # random
get("/random/new") do 
  erb(:random_new)
  end
  
  get("/random/results") do
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f
    @choice = rand(@min..@max)
    erb(:random_results)
  end
