class Schatter::Command::DeleteMessage
  attr_reader :usage, :help, :conversation

  def initialize conversation
    @conversation = conversation
    @usage = '<uuid>'
    @help = 'Deletes the specified message'
  end

  def execute uuid
    message = conversation.messages[uuid]
    message.destroy if message
    puts "#{message.content} destroyed"
  end
end
