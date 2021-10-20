class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. 🍽️  #{order.meal.name} 🏠 #{order.customer.name} 🛴 #{order.employee.username}"
    end
  end

  def ask_user_for(thing)
    puts "Please enter the #{thing}"
    print '> '
    gets.chomp
  end

  def ask_user_for_index(entity)
    ask_user_for("#{entity} number").to_i - 1
  end

  def display_riders(riders)
    riders.each_with_index do |rider, index|
      puts "#{index + 1}. #{rider.username}"
    end
  end
end
