class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
  end

  def delivered?
    @delivered
  end
end
