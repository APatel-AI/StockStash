require "sinatra"
require "sinatra/reloader"
require "http"
get("/") do
  erb(:homepage)
end


get("/search") do
  
  api_url = "https://api.polygon.io/v2/reference/tickers/search?q=#{ticker_symbol}&apiKey=#{ENV["STOCK_API_KEY"]}"
  response = HTTP.get (api_url)
end
