require 'schatter/resource'

class Schatter::Message
  include Schatter::Resource

  def initialize resource
    @resource = resource
  end
end