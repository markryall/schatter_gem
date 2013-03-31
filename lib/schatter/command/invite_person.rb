class Schatter::Command::InvitePerson
  attr_reader :usage, :help, :conversation

  def initialize conversation
    @conversation = conversation
    @usage = '<email>'
    @help = 'Invites someone to join a conversation'
  end

  def execute email
    conversation.create_person email
  end
end
