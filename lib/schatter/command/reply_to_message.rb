class Schatter::Command::ReplyToMessage
  attr_reader :usage, :help, :conversation, :context

  def initialize conversation, context
    @conversation = conversation
    @context = context
    @usage = '<index> <content>'
    @help = 'Replies to the specified message'
  end

  def execute text
    index, content = context.head_tail text
    message = conversation.messages[index.to_i]
    conversation.create_message content: content, parent_id: message.uuid
  end
end
