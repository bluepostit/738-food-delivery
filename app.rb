require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'router'

customer_csv_path = 'data/customers.csv'
customer_repository = CustomerRepository.new(customer_csv_path)
customers_controller = CustomersController.new(customer_repository)

meal_csv_path = 'data/meals.csv'
meal_repository = MealRepository.new(meal_csv_path)
meals_controller = MealsController.new(meal_repository)

router = Router.new(meals_controller, customers_controller)
router.run
