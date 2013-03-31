require 'schatter/resource'

class Schatter::Message
  include Schatter::Resource

  attr_reader :resource

  def initialize resource
    @resource = resource
  end

  def description
    "#{Time.at resource['timestamp']}: #{resource['person']['email']} #{resource['content']}"
  end
end
