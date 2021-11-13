class OrdersView
  def display(orders)
    orders.each do |order|
      puts "🍽️ #{order.meal.name} - 👩‍🦰 #{order.customer.name}"
    end
  end
end
