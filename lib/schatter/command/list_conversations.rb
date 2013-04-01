require 'schatter/colour'

class Schatter::Command::ListConversations
  include Schatter::Colour

  attr_reader :usage, :help, :session

  def initialize session
    @session = session
    @usage = ''
    @help = 'Lists current conversations'
  end

  def execute ignored
    session.conversations(true).values.each do |conversation|
      puts description conversation
    end
  end

  def description conversation
    [
      c(conversation.uuid, :yellow),
      c(conversation.formatted_timestamp, :blue),
      c(conversation.name, :magenta),
    ].join ' '
  end
end
