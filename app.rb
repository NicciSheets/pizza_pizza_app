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
	redirect '/confirm_page?delivery_option=' + delivery_option + '&pizza_size=' + pizza_size + '&pizza_quantity=' + pizza_quantity + '&pizza_crust=' + pizza_crust + '&pizza_toppings=' + pizza_toppings
end

get '/confirm_page' do
	p "params in cofirm page get #{params}"
	total = final_total(params[:pizza_toppings], params[:pizza_crust], params[:pizza_quantity], params[:delivery_option], params[:pizza_size])
	p_quantity = total.values[0]
	p_size = total.values[1]
	p_crust = total.values[2]
	p_toppings = total.values[3]
	toppings = eval(p_toppings)
	p "p_toppings is #{p_toppings} and its class is #{p_toppings.class}"
	p_delivery = total.values[4]
	session[:p_total] = total.values[5]
	p "p_total params are #{session[:p_total]}"
	erb :confirm, locals:{total: total, p_quantity: p_quantity, p_size: p_size, p_crust: p_crust, toppings: toppings, p_delivery: p_delivery} 
end

post '/confirm_page' do
	confirm_quantity = params[:confirm_quantity]
	confirm_size = params[:confirm_size]
	confirm_crust = params[:confirm_crust]
	confirm_topping = params[:confirm_topping]
	confirm_delivery = params[:confirm_delivery]
	#p_total = params[:p_total]
	p "confirm_quantity is #{confirm_quantity} and its class is #{confirm_quantity.class}"
	confirm_arr = []
	confirm_arr << confirm_quantity << confirm_size << confirm_crust << confirm_topping << confirm_delivery
	p "confirm arr is #{confirm_arr} and its class is #{confirm_arr.class}"
	confirm_arr.each do |confirm|
		if confirm == "yes"
			redirect '/total_page'
		else
			redirect '/pizza_options'
		end
	end
end	

get '/pizza_options' do
	erb :options
end

get '/total_page' do
	p "params in total page get are #{session[:p_total]}"
	p_total = session[:p_total]
	erb :total, locals:{p_total: p_total}
end

post '/total_page' do
	
	redirect '/total'
end
