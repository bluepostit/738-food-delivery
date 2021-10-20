require_relative 'app/models/employee'
require_relative 'app/repositories/employee_repository'

sheila = Employee.new(username: 'sheila', password: 'pass', role: 'rider')
billy = Employee.new(username: 'billy', password: 'pass', role: 'manager')

puts "#{sheila.username}/#{sheila.password} - #{sheila.role}"
puts "#{billy.username}/#{billy.password} - #{billy.role}"

employee_repository = EmployeeRepository.new('data/employees.csv')
p employee_repository.all
