require 'httparty'
require 'cgi'

class Schatter::Resource
  def initialize params
    @url = params[:url]
    @resource = params[:resource]
    @url = links[:self] if @resource
  end

  def resource
    return @resource if @resource
    @resource = get @url
  end

  def links
    return @links if @links
    @links = {}
    resource['_links'].each do |k, v|
      @links[k.to_sym] = v['href'].gsub('AUTH_TOKEN', ENV['SCHATTER_AUTH_TOKEN'])
    end
    puts "#{@links}" if ENV['DEBUG']
    @links
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
