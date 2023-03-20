MENU = {Milk: {clubed_quantity: 2, unit_price: 3.97, discounted_price: 5.00}, Bread: {clubed_quantity: 3, unit_price: 2.17, discounted_price: 6.00}, Banana: {unit_price: 0.99}, Apple: {unit_price: 0.89}}.freeze

puts 'Please enter all the items purchased separated by a comma'
purchased_items = gets.chomp.split(',')
billing_quantity = purchased_items.tally
total = 0.0
discount = 0.0
puts "\nItem\tQuantity\tPrice"
puts '-------------------------------------'
billing_quantity.each do |k, v|
  bill = []
  if (MENU[k.capitalize.to_sym].key? :clubed_quantity) && (v % MENU[k.capitalize.to_sym][:clubed_quantity].zero?)
    bill << [k, v.to_i, v.to_i * (MENU[k.capitalize.to_sym][:discounted_price].to_f / v.to_i)]
  elsif MENU[k.capitalize.to_sym].key? :clubed_quantity
    remaning_quantity = v % MENU[k.capitalize.to_sym][:clubed_quantity]
    clubed_quantity_price = (v.to_i - remaning_quantity.to_i)  * discounted_price.to_f
    remaning_quantity_price = remaning_quantity.to_i * MENU[k.capitalize.to_sym][:unit_price]
    bill << [k, v.to_i, clubed_quantity_price + remaning_quantity_price]
  else
    remaning_quantity_price = v.to_i * MENU[k.capitalize.to_sym][:unit_price].to_f
    bill << [k, v.to_i, remaning_quantity_price]
  end
  discount += (v.to_i * MENU[k.capitalize.to_sym][:unit_price]) - bill[0][2]
  total += bill[0][2]
  puts "#{bill[0][0].capitalize}\t#{bill[0][1]}\t\t$#{bill[0][2]}"
end
puts "\nTotal price: $#{total}"
puts "You saved $#{discount.to_f.round(2)} today."



