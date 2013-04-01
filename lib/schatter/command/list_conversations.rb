require 'schatter/colour'
require 'schatter/index'

class Schatter::Command::ListConversations
  include Schatter::Colour
  include Schatter::Index

  attr_reader :usage, :help, :session

  def initialize session
    @session = session
    @usage = ''
    @help = 'Lists current conversations'
  end

  def execute ignored
    session.conversations(true).values.each_with_index do |conversation, index|
      puts description(index, conversation)
    end
  end

  def description index, conversation
    [
      c(to_index(index), :yellow),
      c(conversation.formatted_timestamp, :blue),
      c(conversation.name, :magenta),
    ].join ' '
  end
end
