# def pizza_order(pizza_quantity, pizza_crust, pizza_toppings)
# 	"That'll be #{pizza_quantity} #{pizza_crust} pizzas, with #{pizza_toppings} toppings."
# end


# puts "Welcome to Nicci's Pizza Barn.  How many pizzas would you like?"
# pizza_quantity = gets.chomp.to_i

# puts "Would you like pan crust or hand tossed?"
# pizza_crust = gets.chomp

# puts "And what toppings would you like? We offer pepperoni, sausage, ham, bacon, green peppers, banana peppers, olives, mushrooms, or onions.  You can also add pineapple or extra cheese."
# pizza_toppings = gets.chomp

#puts pizza_order(pizza_quantity, pizza_crust, pizza_toppings)

def crust_subtotal(pizza_crust)
	crust_subtotal_arr = []
	crust = "#{pizza_crust}"
	if crust == "pan crust" || "pan"
		crust_subtotal_arr << 8.00
	else 
		crust_subtotal_arr << 6.00
	end
	crust_subtotal_arr
	#end
	#crust_subtotal_arr.to_s 
	#crust_subtotal_arr.join
end

#puts crust_subtotal(pizza_crust).class


def pizza_toppings_split(pizza_toppings) ####I need to do a regex here to take out any punctuation such as commas that user may input************************
	pizza_toppings.split
end


def toppings(pizza_toppings)
	empty = []
	pizza_toppings = "#{pizza_toppings}"
	toppings_price = {"pepperoni" => 0.50, "sausage" => 0.50, "ham" => 0.75, "bacon" => 0.75, "pineapple" => 1.00, "extra cheese" => 1.00, "green peppers" => 0.25, "banana peppers" => 0.25, "mushrooms" => 0.25, "olives" => 0.25, "onions" => 0.25 }
	toppings_subtotal = 0
	pizza_toppings_split(pizza_toppings).each  do |topping|
		toppings_subtotal = toppings_price.values_at(topping)
		empty << toppings_subtotal
	end
	empty
end

#puts toppings(pizza_toppings).class

def subtotal_array(pizza_toppings, pizza_crust)
	new_array = []
	new_array = toppings(pizza_toppings) << crust_subtotal(pizza_crust)
	new_array.flatten
end


# p subtotal_array(pizza_toppings, pizza_crust)
# puts "Will this be delivery or pick up?  There is a 5 dollar charge for delivery."
# delivery_option = gets.chomp


def delivery(delivery_option)
	delivery_arr = []
	charge = 0
	if delivery_option == "delivery"
		charge += 5.00
	else 
		charge = 0.00
	end
	delivery_arr << charge
end

#puts delivery(delivery_option)




def final_total(pizza_toppings, pizza_crust, pizza_quantity, delivery_option)
	total_arr = []
	taxes = 0.06
	total_arr = subtotal_array(pizza_toppings, pizza_crust) * pizza_quantity.to_f
	tax_and_delivery = (total_arr * taxes) + delivery(delivery_option)
	total = "#{total_arr + tax_and_delivery}"
	"Your total will be $#{total}, with tax.  Thank you for your order!"
end

#puts final_total(pizza_toppings, pizza_crust, pizza_quantity, delivery_option)
# pizza_toppings = "pepperoni", "sausage"
# pizza_crust = "hand tossed"
# pizza_quantity = 3
# delivery_option = delivery
# puts final_total(pizza_toppings, pizza_crust, pizza_quantity, delivery_option)
