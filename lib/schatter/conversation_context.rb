require 'schatter/commands'
require 'shell_shock/context'

class Schatter::ConversationContext
  include Schatter::Command
  include ShellShock::Context

  def initialize conversation
    @prompt = "#{conversation.name} > "
    @conversation = conversation
    add_command load_command(:list_messages, conversation), 'ls'
    add_command load_command(:create_message, conversation), 'touch'
  end
end
