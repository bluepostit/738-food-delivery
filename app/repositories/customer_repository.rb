require_relative './base_repository'
require_relative '../models/customer'

class CustomerRepository < BaseRepository
  private

  def build_element(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end

  def csv_headers
    %w[id name address]
  end

  def build_row(customer)
    [customer.id, customer.name, customer.address]
  end
end
