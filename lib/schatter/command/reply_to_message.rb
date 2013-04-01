class Schatter::Command::ReplyToMessage
  attr_reader :usage, :help, :conversation, :context

  def initialize conversation, context
    @conversation = conversation
    @context = context
    @usage = '<index> <content>'
    @help = 'Replies to the specified message'
  end

  def execute text
    uuid, content = context.head_tail text
    message = conversation.messages[uuid]
    conversation.create_message content: content, parent_id: message.uuid
  end
end
