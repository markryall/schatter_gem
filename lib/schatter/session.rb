require 'schatter/resource'
require 'schatter/conversation'

class Schatter::Session
  include Schatter::Resource

  def initialize url=ENV['SCHATTER_URL']
    @url = url || ENV['SCHATTER_URL'] || 'http://schatter.herokuapp.com'
  end

  def urls
    return @urls if @urls
    @urls = extract_links get @url
  end

  def conversations reload=false
    @conversations = nil if reload
    return @conversations if @conversations
    @conversations = get(urls['conversations'])['conversations'].map do |c|
      Schatter::Conversation.new c
    end
  end

  def conversation index
    conversations[index-1]
  end
end