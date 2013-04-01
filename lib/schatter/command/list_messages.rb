require 'schatter/colour'

class Schatter::Command::ListMessages
  include Schatter::Colour

  attr_reader :usage, :help, :conversation

  def initialize conversation
    @conversation = conversation
    @usage = ''
    @help = 'Lists messages for the current conversation'
  end

  def execute *ignored
    conversation.messages(true).values.each do |message, index|
      puts description message
    end
  end

  def description message
    person = conversation.people[message.person_id]
    email = person ? person.email : '?'
    list = [
      c(message.uuid, :yellow),
      c(message.formatted_timestamp, :blue),
      c(email, :magenta),
      message.content
    ]
    list << c(message.parent_id, :green) if message.parent_id
    list.join ' '
  end
end
