class Schatter::Command::CreateMessage
  attr_reader :usage, :help, :conversation

  def initialize conversation
    @conversation = conversation
    @usage = 'content'
    @help = 'Creates a new message in the current conversation'
  end

  def execute content
    conversation.create_message content: content
  end
end
