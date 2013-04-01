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
      person = conversation.people[message.person_id]
      email = person ? person.email : '?'
      puts "#{c message.uuid, :yellow} #{c message.formatted_timestamp, :blue} #{c email, :magenta} #{message.content}"
    end
  end
end
