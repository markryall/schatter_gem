class Schatter::Command::ListMessages
  attr_reader :usage, :help, :conversation

  def initialize conversation
    @conversation = conversation
    @usage = ''
    @help = 'Lists messages for the current conversation'
  end

  def execute *ignored
    conversation.messages.each_with_index do |conversation, index|
      puts "#{index+1} #{conversation.description}"
    end
  end
end
