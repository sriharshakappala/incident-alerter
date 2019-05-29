require 'securerandom'

class Project

  attr_accessor :name, :employees, :escalation_matrix, :incident

  def initialize name
    @id = project_id
    @name = name
    @employees = []
    @escalation_matrix = {}
    @incidents = []
  end

  def project_id
    SecureRandom.hex(10)
  end

  def create_incident name
    incident = Incident.new(name)
    incident.assigned_to = self.escalation_matrix
  end

end
