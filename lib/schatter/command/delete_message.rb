require 'schatter/index'

class Schatter::Command::DeleteMessage
  include Schatter::Index

  attr_reader :usage, :help, :conversation

  def initialize conversation
    @conversation = conversation
    @usage = '<index>'
    @help = 'Deletes the specified message'
  end

  def execute index
    message = conversation.messages.values[from_index(index)]
    unless message
      puts "invalid index"
      return
    end
    message.destroy
    puts "message #{index} destroyed"
  end
end
