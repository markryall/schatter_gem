require 'schatter/resource'

class Schatter::Message < Schatter::Resource
  def timestamp
    Time.at resource['timestamp']
  end

  def formatted_timestamp
    timestamp.strftime "%d/%m/%Y %H:%M:%S"
  end

  def content
    resource['content']
  end

  def person_id
    resource['person_id']
  end
end