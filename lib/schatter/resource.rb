require 'httparty'
require 'cgi'

module Schatter::Resource
  def extract_links response
    links = {}
    response['_links'].each do |k, v|
      links[k] = v['href'].gsub('AUTH_TOKEN', ENV['SCHATTER_AUTH_TOKEN'])
    end
    links
  end

  def get url
    puts "GET #{url}" if ENV['DEBUG']
    response = HTTParty.get url,
      headers: {'Accept' => 'application/json'}
    puts response if ENV['DEBUG']
    response
  end

  def post url, body
    puts "POST #{url} #{body.to_json}" if ENV['DEBUG']
    response = HTTParty.post url,
      headers: {'Accept' => 'application/json', 'Content-Type' => 'application/json'},
      body: body.to_json
    puts response if ENV['DEBUG']
    response
  end
end
