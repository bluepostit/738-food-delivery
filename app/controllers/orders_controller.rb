require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'
require_relative '../models/order'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @view.display(orders)
  end

  def list_my_orders(employee)
    orders = employee.undelivered_orders
    @view.display(orders)
  end

  def mark_as_delivered(employee)
    order = select_order(employee)
    @order_repository.mark_as_delivered(order)
  end

  def add
    meal = select_meal
    customer = select_customer
    employee = select_rider
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
    employee.add_order(order)
  end

  private

  def select_meal
    meals = @meal_repository.all
    @meals_view.display(meals)
    index = @view.ask_user_for_index('meal')
    meals[index]
  end

  def select_customer
    customers = @customer_repository.all
    @customers_view.display(customers)
    index = @view.ask_user_for_index('customer')
    customers[index]
  end

  def select_rider
    riders = @employee_repository.all_riders
    @view.display_riders(riders)
    index = @view.ask_user_for_index('rider')
    riders[index]
  end

  def select_order(employee)
    orders = employee.undelivered_orders
    @view.display(orders)
    index = @view.ask_user_for_index('order')
    orders[index]
  end
end
