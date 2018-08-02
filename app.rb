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
	# total_order_phrase = "You've ordered '#{pizza_quantity}' '#{pizza_size}' pizza(s), '#{pizza_crust}' with '#{pizza_toppings}' for '#{delivery_option}'."
	# total_order_cost = "Your total will be '#{total}', with tax.  Thank you!"
	# p "total is #{total}"
		erb :total, locals:{total: total} 
end


#*********************8need to work on getting the string of [pizza_toppings] back into an array to proceed with rest of code