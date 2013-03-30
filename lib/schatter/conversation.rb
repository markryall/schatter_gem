class Schatter::Conversation
  attr_reader :resource

  def initialize resource
    @resource = resource
  end

  def description
    "#{resource['name']} #{Time.at resource['timestamp']} (#{resource['uuid']})"
  end
end