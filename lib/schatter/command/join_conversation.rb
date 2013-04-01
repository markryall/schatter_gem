require 'schatter/conversation_context'
require 'schatter/index'

class Schatter::Command::JoinConversation
  include Schatter::Index

  attr_reader :usage, :help, :session

  def initialize session
    @session = session
    @usage = '<index>'
    @help = 'Joins a specified conversation'
  end

  def execute index
    conversation = session.conversations.values[from_index(index)]
    unless conversation
      puts "invalid index"
      return
    end
    Schatter::ConversationContext.new(conversation).push
  end
end
