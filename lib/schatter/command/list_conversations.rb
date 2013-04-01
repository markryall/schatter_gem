class Schatter::Command::ListConversations
  attr_reader :usage, :help, :session

  def initialize session
    @session = session
    @usage = ''
    @help = 'Lists current conversations'
  end

  def execute ignored
    session.conversations(true).each_with_index do |conversation, index|
      puts "#{index} #{conversation.description}"
    end
  end
end
