require 'schatter'
require 'pp'

module Schatter::Cli
  include Schatter

  def execute *args
    puts "Running schatter client version #{Schatter::VERSION}"
    server = Server.new
    pp server.urls
  end
end
