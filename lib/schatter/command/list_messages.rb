class Schatter::Command::ListMessages
  attr_reader :usage, :help, :conversation

  def initialize conversation
    @conversation = conversation
    @usage = ''
    @help = 'Lists messages for the current conversation'
  end

  def execute *ignored
    conversation.messages.each_with_index do |message, index|
      p message.person_id
      person = conversation.people[message.person_id]
      p person
      puts "#{index+1} #{message.timestamp} #{person.email} #{message.content}"
    end
  end
end
