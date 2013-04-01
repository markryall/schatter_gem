require 'schatter/resource'
require 'schatter/message'
require 'schatter/person'

class Schatter::Conversation < Schatter::Resource
  def messages
    @messages = get(links[:messages])['messages'].map do |resource|
      Schatter::Message.new resource: resource
    end
  end

  def people
    @people = get(links[:people])['people'].map do |resource|
      Schatter::Person.new resource: resource
    end
  end

  def create_message content
    post links[:messages], content: content
  end

  def create_person email
    post links[:people], email: email
  end

  def name
    resource['name']
  end

  def description
    "#{resource['name']} #{Time.at resource['timestamp']} (#{resource['uuid']})"
  end
end
