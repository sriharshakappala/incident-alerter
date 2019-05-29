require 'securerandom'

class Employee

  attr_accessor :name, :email_id, :phone_number

  def initialize name, email_id, phone_number
    @employee_id = employee_id
    @name = name
    @email_id = email_id
    @phone_number = phone_number
  end

  def employee_id
    SecureRandom.hex(10)
  end

end
