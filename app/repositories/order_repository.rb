require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(csv_file_path, meal_repository,
                 customer_repository, employee_repository)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @next_id = 1
    load_csv if File.exist?(csv_file_path)
  end

  def all
    @orders
  end

  def create(order)
    order.id = @next_id
    employee = order.employee
    employee.add_order(order)

    @next_id += 1
    @orders << order
    save_csv
  end

  def find(id)
    @orders.find { |order| order.id == id }
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end

  private

  def build_order(row)
    row[:id] = row[:id].to_i
    row[:delivered] = row[:delivered] == 'true'
    row[:meal] = @meal_repository.find(row[:meal_id].to_i)
    row[:customer] = @customer_repository.find(row[:customer_id].to_i)
    row[:employee] = @employee_repository.find(row[:employee_id].to_i)
    Order.new(row)
  end

  def load_csv
    csv_options = {
      headers: :first_row,
      header_converters: :symbol
    }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      order = build_order(row)
      order.employee.add_order(order)
      @orders << order
    end
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << %w[id delivered meal_id customer_id employee_id]
      @orders.each do |order|
        csv << [order.id, order.delivered?, order.meal.id,
                order.customer.id, order.employee.id]
      end
    end
  end
end
