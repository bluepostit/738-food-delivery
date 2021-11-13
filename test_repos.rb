require_relative 'app/repositories/order_repository'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'

meal_csv_path = 'data/meals.csv'
meal_repository = MealRepository.new(meal_csv_path)

customer_csv_path = 'data/customers.csv'
customer_repository = CustomerRepository.new(customer_csv_path)

employee_csv_path = 'data/employees.csv'
employee_repository = EmployeeRepository.new(employee_csv_path)

order_csv_path = 'data/orders.csv'
order_repo = OrderRepository.new(order_csv_path, meal_repository, customer_repository, employee_repository)
p order_repo.all
