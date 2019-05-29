require 'securerandom'

class Incident

  attr_accessor :name, :assigned_to

  def initialize name, assigned_to
    @name = name
    @assigned_to = assigned_to
  end

  def notifiy
  end

end
