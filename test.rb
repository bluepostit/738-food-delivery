require_relative 'app/models/meal'
require_relative 'app/repositories/meal_repository'

ramen = Meal.new(name: 'ramen', price: 4)
puts "#{ramen.name} - #{ramen.price}"
p ramen

meal_repository = MealRepository.new('data/meals.csv')
p meal_repository.all
