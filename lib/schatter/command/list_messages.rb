class Schatter::Command::ListMessages
  attr_reader :usage, :help, :conversation

  def initialize conversation
    @conversation = conversation
    @usage = ''
    @help = 'Lists messages for the current conversation'
  end

  def execute *ignored
    conversation.messages.each_with_index do |message, index|
      person = conversation.people[message.person_id]
      email = person ? person.email : '?'
      puts "#{index+1} #{message.timestamp} #{email} #{message.content}"
    end
  end
end
