require 'schatter/resource'
require 'schatter/message'
require 'schatter/person'

class Schatter::Conversation < Schatter::Resource
  def messages reload=false
    @messages = nil if reload
    return @messages if @messages
    @messages = Hash[get(links[:messages])['messages'].map do |resource|
      [resource['uuid'], Schatter::Message.new(resource: resource)]
    end]
  end

  def new_messages
    params = {}
    params[:message_id] = @messages.last.uuid unless @messages.empty?
    Hash[get(url, params)['messages'].map do |resource|
      [resource['uuid'], Schatter::Message.new(resource: resource)]
    end]
  end

  def people reload=false
    @people = nil if reload
    return @people if @people
    @people = Hash[get(links[:people])['people'].map do |resource|
      [resource['uuid'], Schatter::Person.new(resource: resource)]
    end]
  end

  def create_message params
    post links[:messages], params
  end

  def create_person params
    post links[:people], params
  end

  def name
    resource['name']
  end
end
