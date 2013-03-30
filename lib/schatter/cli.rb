require 'schatter/version'
require 'schatter/session'
require 'shell_shock/context'
require 'schatter/command/list_conversations'

class Schatter::Cli
  include ShellShock::Context

  def initialize
    @prompt = "schatter.#{Schatter::VERSION} > "
    session = Schatter::Session.new
    add_command Schatter::Command::ListConversations.new(session), 'ls'
  end
end
