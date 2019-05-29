require 'singleton'
require 'pry'

require './models/project'
require './models/employee'

class RunnerService
  include Singleton

  attr_accessor :projects, :employees

  def initialize
    @projects = []
    @employees = []
  end

  def add_project name
    begin
      project = Project.new(name)
      projects << project
      response = {"status": "success"}
    rescue
    end
    pp response
  end

  def add_employee name, email_id, phone_number
    begin
      employee = Employee.new(name, email_id, phone_number)
      employees << employee
      response = {"status": "success"}
    rescue
    end
    pp response
  end

  def assign_project project_name, employee_name
    project = get_project(project_name)
    employee = get_employee(employee_name)
    if project && employee
      project.employees << employee
      response = {"status": "success"}
    end
    pp response
  end

  def set_level project_name, employee_name, level
    project = get_project(project_name)
    employee = get_employee(employee_name)
    if project && employee
      if project.escalation_matrix.values.map(&:name).include? employee_name
        response = {"status": "Employee already in escalation matrix"}
      elsif project.escalation_matrix[level].nil?
        project.escalation_matrix[level] = employee
        response = {"status": "success"}
      else
        response = {"status": "error", "message": "This level is already assigned for the project"}
      end
    end
    pp response
  end

  def unset_level project_name, level
    project = get_project(project_name)
    project.escalation_matrix.delete(level)
    response = {"status": "success"}
    pp response
  end

  private

  def get_project project_name
    return projects.find { |p| p.name == project_name }
  end

  def get_employee employee_name
    return employees.find { |e| e.name == employee_name }
  end

end
