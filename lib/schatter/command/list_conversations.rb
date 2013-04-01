class Schatter::Command::ListConversations
  attr_reader :usage, :help, :session

  def initialize session
    @session = session
    @usage = ''
    @help = 'Lists current conversations'
  end

  def execute ignored
    session.conversations(true).values.each do |conversation|
      puts "#{conversation.uuid} #{conversation.description}"
    end
  end
end
