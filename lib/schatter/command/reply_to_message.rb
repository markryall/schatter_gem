require 'schatter/index'

class Schatter::Command::ReplyToMessage
  include Schatter::Index

  attr_reader :usage, :help, :conversation, :context

  def initialize conversation, context
    @conversation = conversation
    @context = context
    @usage = '<index> <content>'
    @help = 'Replies to the specified message'
  end

  def execute text
    index, content = context.head_tail text
    message = conversation.messages.values[from_index(index)]
    unless message
      puts "invalid index #{index}"
      return
    end
    conversation.create_message content: content, parent_id: message.uuid
  end
end