require 'schatter/conversation_context'

class Schatter::Command::CreateConversation
  attr_reader :usage, :help, :session

  def initialize session
    @session = session
    @usage = '<name>'
    @help = 'Creates and joins a new conversation'
  end

  def execute name
    conversation = session.create_conversation name
    Schatter::ConversationContext.new(conversation).push
  end
end
