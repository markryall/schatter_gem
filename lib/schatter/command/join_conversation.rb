require 'schatter/conversation_context'

class Schatter::Command::JoinConversation
  attr_reader :usage, :help, :session

  def initialize session
    @session = session
    @usage = '<uuid>'
    @help = 'Joins a specified conversation'
  end

  def execute uuid
    conversation = session.conversations[uuid]
    Schatter::ConversationContext.new(conversation).push
  end
end
