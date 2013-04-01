require 'schatter/resource'
require 'schatter/conversation'

class Schatter::Session < Schatter::Resource
  def conversations reload=false
    @conversations = nil if reload
    return @conversations if @conversations
    @conversations = get(links[:conversations])['conversations'].map do |resource|
      Schatter::Conversation.new resource: resource
    end
  end

  def create_conversation name
    Schatter::Conversation.new post links['conversations'], name: name
  end
end