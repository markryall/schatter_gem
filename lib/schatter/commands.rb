module Schatter::Command
  def load_command name, *args
    require "schatter/command/#{name}"
    Schatter::Command.const_get(classify name.to_s).new(*args)
  end

  def classify s
    s.to_s.split('_').map(&:capitalize).join
  end
end