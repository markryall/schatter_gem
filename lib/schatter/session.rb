require 'schatter/resource'
require 'schatter/conversation'

class Schatter::Session < Schatter::Resource
  def conversations reload=false
    @conversations = nil if reload
    return @conversations if @conversations
    @conversations = Hash[get(links[:conversations])['conversations'].map do |resource|
      [resource['uuid'], Schatter::Conversation.new(resource: resource)]
    end]
  end

  def create_conversation name
    Schatter::Conversation.new post links['conversations'], name: name
  end
end