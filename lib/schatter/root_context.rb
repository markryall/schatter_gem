require 'schatter/version'
require 'schatter/session'
require 'schatter/commands'
require 'shell_shock/context'

class Schatter::RootContext
  include Schatter::Command
  include ShellShock::Context

  def initialize url=nil
    url = "http://localhost:3000" unless url
    @prompt = "schatter.#{Schatter::VERSION} > "
    session = Schatter::Session.new url: url
    add_command load_command(:list_conversations, session), 'ls'
    add_command load_command(:join_conversation, session), 'cd'
    add_command load_command(:create_conversation, session), 'md'
  end
end
