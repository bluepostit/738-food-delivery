class Employee
  attr_reader :username, :password, :role
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
    @orders = []
  end

  def add_order(order)
    @orders << order
    order.employee = self
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def manager?
    @role == 'manager'
  end

  def rider?
    @role == 'rider'
  end
end
