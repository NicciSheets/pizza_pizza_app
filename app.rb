require 'sinatra'
require_relative 'pizza_app.rb'

enable :sessions

get '/' do
  
  erb :options
end

post '/pizza_options' do
	delivery_option = session[:delivery_option]
	pizza_quantity = session[:pizza_quantity]
	pizza_crust = session[:pizza_crust]
	pizza_toppings = session[:pizza_toppings]
	p "params are #{params}"
	p "delivery session is #{session[:delivery_option]}"
	redirect '/total'
	#redirect '/'
end

get '/total' do
session[:delivery_option] = params[:delivery_option]
	session[:pizza_quantity] = params[:pizza_quantity]
	session[:pizza_crust] = params[:pizza_crust]
	session[:pizza_toppings] = params[:pizza_toppings]
	p "params are #{params}"
session[:final_total] = final_total(params[:pizza_toppings], params[:pizza_crust], params[:pizza_quantity], params[:delivery_option])
	erb :total, locals:{final_total: final_total, pizza_toppings: pizza_toppings, pizza_crust: pizza_crust, pizza_quantity: pizza_quantity, delivery_options: delivery_options}
end


