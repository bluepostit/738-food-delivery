require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    # get meals from repo
    # display them using the view
    meals = @meal_repository.all
    @view.display(meals)
  end

  def add
    # ask user for the meal name
    # ask user for the meal price
    # create a new Meal with this info
    # add to repository
    name = @view.ask_user_for('name')
    price = @view.ask_user_for_price
    meal = Meal.new(name: name, price: price)
    @meal_repository.create(meal)
  end
end
