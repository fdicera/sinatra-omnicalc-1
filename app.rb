require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Random Results</h1>
  "
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  erb(:square_results)
end
