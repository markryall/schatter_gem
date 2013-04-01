class Schatter::Command::ListPeople
  attr_reader :usage, :help, :conversation

  def initialize conversation
    @conversation = conversation
    @usage = ''
    @help = 'Lists people in the current conversation'
  end

  def execute *ignored
    conversation.people.values.each do |person|
      puts "#{person.email}"
    end
  end
end
