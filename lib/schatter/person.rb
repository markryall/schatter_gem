require 'schatter/resource'

class Schatter::Person < Schatter::Resource
  def email
    resource['email']
  end
end
