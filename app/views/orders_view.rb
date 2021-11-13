class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. 🍽️ #{order.meal.name} - #{order.customer.name}"
    end
  end

  def ask_user_for_index
    puts "Please enter the number"
    gets.chomp.to_i - 1
  end

  def display_employees(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username}"
    end
  end
end
