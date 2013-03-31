class Schatter::Command::CreateMessage
  attr_reader :usage, :help, :conversation

  def initialize conversation
    @conversation = conversation
    @usage = ''
    @help = 'Lists messages for the current conversation'
  end

  def execute message
    conversation.create_message message
  end
end
