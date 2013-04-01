require 'schatter/resource'

class Schatter::Message < Schatter::Resource
  def content
    resource['content']
  end

  def person_id
    resource['person_id']
  end

  def parent_id
    resource['parent_id']
  end
end