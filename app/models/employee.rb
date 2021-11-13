class Employee
  attr_reader :username, :password, :role, :orders
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
    @orders = []
  end

  def manager?
    @role == 'manager'
  end

  def rider?
    @role == 'rider'
  end

  def add_order(order)
    @orders << order
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end
end
