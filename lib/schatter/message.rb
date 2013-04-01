require 'schatter/resource'

class Schatter::Message < Schatter::Resource
  def timestamp
    Time.at resource['timestamp']
  end

  def content
    resource['content']
  end

  def person_id
    resource['person_id']
  end
end