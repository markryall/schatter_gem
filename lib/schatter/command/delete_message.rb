class Schatter::Command::DeleteMessage
  attr_reader :usage, :help, :conversation

  def initialize conversation
    @conversation = conversation
    @usage = '<index>'
    @help = 'Deletes the specified message'
  end

  def execute index
    message = conversation.messages[index.to_i]
    message.destroy if message
    puts "#{message.content} destroyed"
  end
end
