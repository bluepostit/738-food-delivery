class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    @running = true
    while @running
      # show menu
      # get user choice
      # dispatch user choice
      show_menu
      choice = user_choice
      dispatch(choice)
    end
  end

  private

  def show_menu
    puts '---- Restaurant -----'
    puts "1. List all meals"
    puts "2. Add a meal"
    puts "3. List all customers"
    puts "4. Add a customer"
    puts "9. Exit"
  end

  def user_choice
    puts "Please select an option"
    print '> '
    gets.chomp.to_i
  end

  def dispatch(action)
    puts `clear`
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then @running = false
    else puts 'Please try again'
    end
  end
end
