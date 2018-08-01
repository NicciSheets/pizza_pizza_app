# pizza_toppings = ["pepperoni", "sausage"]
#  pizza_crust = "hand tossed"
#   pizza_quantity = 1
#   delivery_option = "delivery"

def crust_subtotal(pizza_crust)
	crust_subtotal_arr = []
	crust = "#{pizza_crust}"
	if crust == "pan crust" 
		crust_subtotal_arr << 8.00
	else 
		crust_subtotal_arr << 6.00
	end
	crust_subtotal_arr
end



def toppings(pizza_toppings)
	empty = []
	pizza_toppings = pizza_toppings.split(/,/)
	toppings_price = {"pepperoni" => 0.50, "sausage" => 0.50, "ham" => 0.75, "bacon" => 0.75, "pineapple" => 1.00, "extra cheese" => 1.00, "green peppers" => 0.25, "banana peppers" => 0.25, "mushrooms" => 0.25, "olives" => 0.25, "onions" => 0.25 }
	toppings_subtotal = 0
	pizza_toppings.each  do |topping|
		toppings_subtotal = toppings_price.values_at(topping)
		empty << toppings_subtotal
	end
	empty
p "toppings are #{toppings(pizza_toppings)}"
end

def subtotal_array(pizza_toppings, pizza_crust)
	new_array = []
	new_array = toppings(pizza_toppings) << crust_subtotal(pizza_crust)
	new_array.flatten
p "subtotal_array is #{subtotal_array(pizza_toppings, pizza_crust)}"
end


def delivery(delivery_option)
	delivery_arr = []
	charge = 0
	if delivery_option == "delivery"
		charge += 5.00
	else 
		charge = 0.00
	end
	delivery_arr << charge
p "delivery charge is #{delivery(delivery_option)}"
end


def final_total(pizza_toppings, pizza_crust, pizza_quantity, delivery_option)
	total_arr = []
	back_to_array = []
	pizza_toppings.split(/,/)
	taxes = 0.06
	total_arr = subtotal_array(pizza_toppings, pizza_crust) * pizza_quantity.to_f
	tax_and_delivery = (total_arr * taxes) + delivery(delivery_option)
	total_arr << tax_and_delivery
	p "total_arr is #{total_arr}"
	total = total_arr.flatten.sum
	p "I have your order as #{pizza_quantity} #{pizza_crust} pizza(s) with #{pizza_toppings} for #{delivery_option}.  Your total is $#{total}, with tax.  Thank you for your order!"
end


#final_total(pizza_toppings, pizza_crust, pizza_quantity, delivery_option)
#p "final total is #{final_total(pizza_toppings, pizza_crust, pizza_quantity, delivery_option)}"