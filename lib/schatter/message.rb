require 'schatter/resource'

class Schatter::Message < Schatter::Resource
  def description
    "#{Time.at resource['timestamp']}: #{resource['person']['email']} #{resource['content']}"
  end
end
