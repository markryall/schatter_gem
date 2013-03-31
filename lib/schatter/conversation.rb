require 'schatter/resource'

class Schatter::Conversation
  include Schatter::Resource

  attr_reader :resource, :name, :urls

  def initialize resource
    @resource = resource
    @name = resource['name']
    @urls = extract_links resource
  end

  def messages
    @messages = get(urls['messages'])['messages'].map do |resource|
      Schatter::Message.new resource
    end
  end

  def description
    "#{resource['name']} #{Time.at resource['timestamp']} (#{resource['uuid']})"
  end
end
