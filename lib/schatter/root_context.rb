require 'schatter/version'
require 'schatter/session'
require 'schatter/commands'
require 'shell_shock/context'

class Schatter::RootContext
  include Schatter::Command
  include ShellShock::Context

  def initialize url=nil
    url = "http://localhost:3000" unless url
    unless ENV['SCHATTER_AUTH_TOKEN']
      puts "Please register at #{url} and set environment variable SCHATTER_AUTH_TOKEN"
      exit 1
    end
    @prompt = "schatter.#{Schatter::VERSION} #{url}> "
    session = Schatter::Session.new url: url
    add_command load_command(:list_conversations, session), "'"
    add_command load_command(:join_conversation, session), 'join'
    add_command load_command(:create_conversation, session), 'create'
  end
end