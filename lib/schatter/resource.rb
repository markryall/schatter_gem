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
    response = HTTParty.get url, headers: {'Accept' => 'application/json'}
    puts response if ENV['DEBUG']
    response
  end
end