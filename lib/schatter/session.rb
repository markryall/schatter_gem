require 'httparty'
require 'cgi'

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
    puts urls['conversations']
  end

  def extract_links response
    links = {}
    response['_links'].each do |k, v|
      links[k] = v['href']
    end
    links
  end

  def get url
    HTTParty.get url, headers: {'Accept' => 'application/json'}
  end
end