require 'schatter/conversation_context'

class Schatter::Command::JoinConversation
  attr_reader :usage, :help, :session

  def initialize session
    @session = session
    @usage = '<index>'
    @help = 'Joins a specified conversation'
  end

  def execute index
    conversation = session.conversations[index.to_i]
    Schatter::ConversationContext.new(conversation).push
  end
end
