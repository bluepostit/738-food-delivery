class Router
  def initialize(meals_controller, customers_controller, sessions_controller,
                 orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
  end

  def run
    @running = true
    while @running
      @employee = @sessions_controller.sign_in
      while @employee
        # show menu
        # get user choice
        # dispatch user choice
        show_menu
        choice = user_choice
        dispatch(choice)
      end
    end
  end

  private

  def show_menu
    if @employee.manager?
      show_manager_menu
    else
      show_rider_menu
    end
  end

  def dispatch(action)
    puts `clear`
    if @employee.manager?
      dispatch_manager_action(action)
    else
      dispatch_rider_action(action)
    end
  end

  def show_rider_menu
    puts '---- 🛴 Restaurant 🛴 -----'
    puts "1. List my undelivered orders"
    puts "2. Mark an order as delivered"
    puts "8. Sign out"
    puts "9. Exit"
  end

  def show_manager_menu
    puts '---- 💼 Restaurant 💼 -----'
    puts "1. List all meals"
    puts "2. Add a meal"
    puts "3. List all customers"
    puts "4. Add a customer"
    puts "5. List all undelivered orders"
    puts "6. Add a new order"
    puts "8. Sign out"
    puts "9. Exit"
  end

  def user_choice
    puts "Please select an option"
    print '> '
    gets.chomp.to_i
  end

  def dispatch_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    else dispatch_common_actions(action)
    end
  end

  def dispatch_rider_action(action)
    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    else dispatch_common_actions(action)
    end
  end

  def dispatch_common_actions(action)
    case action
    when 8 then @employee = nil
    when 9 then exit
    else puts 'Please try again'
    end
  end

  def exit
    @employee = nil
    @running = false
  end
end
