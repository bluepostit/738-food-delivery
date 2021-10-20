require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # get username from user (view)
    # get password from user (view)
    # check for a user with this username and password
    #   1. find a user with this username
    #   2. if found, check if password matches
    #   3. if either of the above fails, respond with error message
    #   4. if all matches, respond with success message
    # respond
    username = @view.ask_user_for('user name')
    password = @view.ask_user_for('password')
    employee = @employee_repository.find_by_username(username)
    if employee && employee.password == password
      @view.welcome(employee)
      return employee
    else
      @view.failed
      sign_in
    end
  end
end
