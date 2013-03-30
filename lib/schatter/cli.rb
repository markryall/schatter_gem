require 'schatter/version'
require 'schatter/session'
require 'schatter/commands'
require 'shell_shock/context'

class Schatter::Cli
  include Schatter::Command
  include ShellShock::Context

  def initialize
    @prompt = "schatter.#{Schatter::VERSION} > "
    session = Schatter::Session.new
    add_command load_command(:list_conversations, session), 'ls'
  end
end
