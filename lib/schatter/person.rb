require 'schatter/resource'

class Schatter::Person
  include Schatter::Resource

  attr_reader :resource

  def initialize resource
    @resource = resource
  end

  def email
    resource['email']
  end
end
