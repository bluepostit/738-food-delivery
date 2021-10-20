class SessionsView
  def ask_user_for(item)
    puts "Please enter #{item}:"
    print '> '
    gets.chomp
  end

  def welcome(employee)
    puts "Welcome, #{employee.username}!"
  end

  def failed
    puts "Please try again"
  end
end
