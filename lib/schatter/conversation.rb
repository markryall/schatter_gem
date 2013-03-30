class Schatter::Conversation
  attr_reader :resource, :name

  def initialize resource
    @resource = resource
    @name = resource['name']
  end

  def description
    "#{resource['name']} #{Time.at resource['timestamp']} (#{resource['uuid']})"
  end
end