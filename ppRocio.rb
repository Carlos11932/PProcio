#------------------------father class----------

class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end
#------------------inherits from Employee --------------------

class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        super(name, email)
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      @hourly_rate * @hours_worked
    end
end

class SalariedEmployee < Employee
	def initialize(name, email, salary)
		super(name, email)
		@salary = salary
	end

	def calculate_salary
    @salary / 52
	end

end

class MultiPaymentEmployee < Employee
	def initialize(name, email, salary, hourly_rate, hours_worked)
		super(name, email)
		@salary = salary
		@hourly_rate = hourly_rate
		@hours_worked = hours_worked		
	end

	def calculate_salary
		if @hours_worked > 40
			@salary / 52 + ((@hours_worked - 40) * @hourly_rate)
		else
			@salary	/ 52
		end
	end
end	

#---------------------Payroll--------------------



class Payroll
  def initialize(employees)
    @employees = employees
  end

  def notify_employees(employee)
    puts("#{employee.email}: Your salary of #{employee.calculate_salary}$ is done.")
  end

  def pay_employees
    @employees.reduce(0) do |memo, employee|
      salary_employee = employee.calculate_salary + employee.calculate_salary * 0.18
      puts("#{employee.name}: #{salary_employee}")
      notify_employees(employee)
    	memo + salary_employee
  def pay_employees
    @employees.reduce(0) do |memo, employee|
    	memo + employee.calculate_salary
    end 
  end
end


josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
carlos = HourlyEmployee.new('Carlos', 'carlosemail@example.com', 15, 35)
rocio = HourlyEmployee.new('Rocio', 'rocioemail@example.com', 15, 45)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)

employees = []

employees << josh
employees << carlos
employees << rocio
employees << nizar
employees << ted

payroll = Payroll.new(employees)
puts ("Total: " + (payroll.pay_employees).round(2).to_s + "$")
puts (payroll.pay_employees)
