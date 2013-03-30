class Schatter::Command::ListConversations
  attr_reader :usage, :help, :session

  def initialize session
    @session = session
    @usage = ''
    @help = 'Lists current conversations'
  end

  def execute *ignored
    puts session.conversations
  end
end
