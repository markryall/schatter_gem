require 'schatter/conversation_context'

class Schatter::Command::JoinConversation
  attr_reader :usage, :help, :session

  def initialize session
    @session = session
    @usage = '<index>'
    @help = 'Joins a specified conversation'
  end

  def execute id
    conversation = session.conversation id.to_i
    puts "joining conversation #{conversation}"
    context = Schatter::ConversationContext.new conversation
    context.push
  end
end
