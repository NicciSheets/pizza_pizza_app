require 'sinatra'
require_relative 'pizza_app.rb'


enable :sessions

get '/' do
  
  erb :options
end

post '/pizza_options' do
	delivery_option = params[:delivery_option]
	pizza_size  = params[:pizza_size]
	pizza_quantity = params[:how_many]
	pizza_crust = params[:crust_type]
	pizza_toppings = params[:toppings].to_s
	p "params in pizza options are #{params}"
	redirect '/total_page?delivery_option=' + delivery_option + '&pizza_size=' + pizza_size + '&pizza_quantity=' + pizza_quantity + '&pizza_crust=' + pizza_crust + '&pizza_toppings=' + pizza_toppings
end

get '/total_page' do
	p "params in total #{params}"
	total = final_total(params[:pizza_toppings], params[:pizza_crust], params[:pizza_quantity], params[:delivery_option], params[:pizza_size])
	p_quantity = total.values[0]
	p_size = total.values[1]
	p_crust = total.values[2]
	p_toppings = total.values[3]
	toppings = eval(p_toppings)
	p "p_toppings is #{p_toppings} and its class is #{p_toppings.class}"
	p_delivery = total.values[4]
	p_total = total.values[5]
	erb :total, locals:{total: total, p_quantity: p_quantity, p_size: p_size, p_crust: p_crust, toppings: toppings, p_delivery: p_delivery, p_total: p_total} 
end


