require "sinatra"
require "sinatra/reloader"
require "http"
get("/") do
  erb(:homepage)
end


get("/get_stock_data") do

  #query parameters
  ticker_symbol = params[:ticker]
  start_date = params[:start_date]
  end_date = params[:end_date]


  api_url = "https://api.polygon.io/v2/aggs/ticker/#{ticker_symbol}/range/1/day/#{start_date}/#{end_date}?adjusted=true&sort=asc&limit=120&apiKey=#{ENV["STOCK_API_KEY"]}"
  response = HTTP.get (api_url)


  #200 ok response handler

  if response.code == 200
    @stock_data = JSON.parse(response.body)
    erb(:results)

  else
    # error 401, 404, etc..
    @error_message = "Error: #{response.code}, #{response.reason}"

  end

end
