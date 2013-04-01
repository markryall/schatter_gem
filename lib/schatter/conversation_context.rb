require 'schatter/commands'
require 'shell_shock/context'

class Schatter::ConversationContext
  include Schatter::Command
  include ShellShock::Context

  def initialize conversation
    @prompt = "#{conversation.name} > "
    @conversation = conversation
    add_command load_command(:list_messages, conversation), "'"
    add_command load_command(:create_message, conversation), 'say'
    add_command load_command(:reply_to_message, conversation, self), 'reply'
    add_command load_command(:delete_message, conversation), 'delete'
    add_command load_command(:invite_person, conversation), 'invite'
    add_command load_command(:list_people, conversation), 'who'
  end
end
