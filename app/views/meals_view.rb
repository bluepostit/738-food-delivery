class MealsView
  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} - #{meal.price}€"
    end
  end

  def ask_user_for(thing)
    puts "Please enter the meal #{thing}"
    print '> '
    gets.chomp
  end

  def ask_user_for_price
    ask_user_for('price').to_i
  end
end
