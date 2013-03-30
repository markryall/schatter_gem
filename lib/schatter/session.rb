require 'httparty'
require 'cgi'
require 'schatter/conversation'

class Schatter::Session
  def initialize url=ENV['SCHATTER_URL']
    @url = url || ENV['SCHATTER_URL'] || 'http://schatter.herokuapp.com'
    @auth_token = ENV['SCHATTER_AUTH_TOKEN']
  end

  def urls
    return @urls if @urls
    @urls = extract_links get @url
  end

  def conversations
    @conversations = get(urls['conversations'])['conversations'].map {|c| Schatter::Conversation.new c }
  end

  def conversation index
    @conversations[index]
  end

  def extract_links response
    links = {}
    response['_links'].each do |k, v|
      links[k] = v['href'].gsub('AUTH_TOKEN', @auth_token)
    end
    links
  end

  def get url
    HTTParty.get url, headers: {'Accept' => 'application/json'}
  end
end