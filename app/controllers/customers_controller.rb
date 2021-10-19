require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    # get customers from repo
    # display them using the view
    customers = @customer_repository.all
    @view.display(customers)
  end

  def add
    # ask user for the customer name
    # ask user for the customer address
    # create a new Customer with this info
    # add to repository
    name = @view.ask_user_for('name')
    address = @view.ask_user_for('address')
    customer = Customer.new(name: name, address: address)
    @customer_repository.create(customer)
  end
end
