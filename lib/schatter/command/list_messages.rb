require 'schatter/colour'
require 'schatter/index'

class Schatter::Command::ListMessages
  include Schatter::Colour
  include Schatter::Index

  attr_reader :usage, :help, :conversation

  def initialize conversation
    @conversation = conversation
    @usage = ''
    @help = 'Lists messages for the current conversation'
  end

  def execute *ignored
    conversation.messages(true).values.each_with_index do |message, index|
      puts description message, index
    end
  end

  def description message, index
    person = conversation.people[message.person_id]
    parent_index = conversation.messages.keys.index message.parent_id
    email = person ? person.email : '?'
    list = [
      c(to_index(index), :yellow),
      c(message.formatted_timestamp, :blue),
      c(email, :magenta),
      message.content
    ]
    list << c("(reply to #{to_index(parent_index)})", :green) if parent_index
    list.join ' '
  end
end