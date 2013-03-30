require 'schatter'

module Schatter::Cli
  include Schatter

  def execute *args
    puts "Running schatter client version #{Schatter::VERSION}"
  end
end
