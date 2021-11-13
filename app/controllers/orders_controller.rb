require_relative '../views/orders_view'
require_relative '../views/customers_view'
require_relative '../views/meals_view'

class OrdersController
  def initialize(meal_repository, customer_repository,
                 employee_repository, order_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @view = OrdersView.new
  end

  def list_undelivered_orders
    # get all undelivered orders from order repo
    # list them using the orders view
    orders = @order_repository.undelivered_orders
    @view.display(orders)
  end

  def list_my_orders(employee)
    orders = employee.undelivered_orders
    @view.display(orders)
  end

  def mark_as_delivered(employee)
    undelivered_orders = employee.undelivered_orders
    @view.display(undelivered_orders)
    index = @view.ask_user_for_index
    order = undelivered_orders[index]
    @order_repository.mark_as_delivered(order)
  end

  def add
    # ask user to choose a meal
    # ask user to choose a customer
    # ask user to choose a rider (employee)
    # create a new Order with these params
    # save it in the repository
    meal = choose_meal
    customer = choose_customer
    rider = choose_rider
    order = Order.new(meal: meal, customer: customer, employee: rider)
    @order_repository.create(order)
  end

  def choose_meal
    # fetch all meals from meal repo
    # display them using a view
    # ask user for index
    # return MEAL (array + index)
    meals = @meal_repository.all
    MealsView.new.display(meals)
    index = @view.ask_user_for_index
    meals[index]
  end

  def choose_customer
    # fetch all customers from meal repo
    # display them using a view
    # ask user for index
    # return MEAL (array + index)
    customers = @customer_repository.all
    CustomersView.new.display(customers)
    index = @view.ask_user_for_index
    customers[index]
  end

  def choose_rider
    # fetch all customers from meal repo
    # display them using a view
    # ask user for index
    # return MEAL (array + index)
    riders = @employee_repository.all_riders
    @view.display_employees(riders)
    index = @view.ask_user_for_index
    riders[index]
  end
end
