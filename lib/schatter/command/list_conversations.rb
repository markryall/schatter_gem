class Schatter::Command::ListConversations
  attr_reader :usage, :help, :session

  def initialize session
    @session = session
    @usage = ''
    @help = 'Lists current conversations'
  end

  def execute *ignored
    session.conversations.each_with_index do |conversation, index|
      puts "#{index+1} #{Time.at conversation['timestamp']} #{conversation['uuid']}"
    end
  end
end
