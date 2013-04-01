class Schatter::Command::ListMessages
  attr_reader :usage, :help, :conversation

  def initialize conversation
    @conversation = conversation
    @usage = ''
    @help = 'Lists messages for the current conversation'
  end

  def execute *ignored
    conversation.people.each_with_index do |person|
      puts "#{index+1} #{message.description}"
    end
  end
end
