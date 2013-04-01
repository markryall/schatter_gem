require 'httparty'
require 'cgi'

class Schatter::Resource
  def initialize params
    @url = params[:url]
    @resource = params[:resource]
    @url = links[:self] if @resource
  end

  def destroy
    delete @url
  end

  def resource
    return @resource if @resource
    @resource = get @url
  end

  def links
    return @links if @links
    @links = {}
    resource['_links'].each do |k, v|
      @links[k.to_sym] = v['href']
    end
    puts "#{@links}" if ENV['DEBUG']
    @links
  end

  def uuid
    resource['uuid']
  end

  def get url, params={}
    params[:auth_token] = ENV['SCHATTER_AUTH_TOKEN']
    full_url = "#{url}?#{params.map{ |k,v| "#{k}=#{CGI.escape v.to_s}" }.join('&')}"
    puts "GET #{full_url}" if ENV['DEBUG']
    response = HTTParty.get full_url,
      headers: {'Accept' => 'application/json'}
    puts response if ENV['DEBUG']
    response
  end

  def delete url, params={}
    params[:auth_token] = ENV['SCHATTER_AUTH_TOKEN']
    full_url = "#{url}?#{params.map{ |k,v| "#{k}=#{CGI.escape v.to_s}" }.join('&')}"
    puts "DELETE #{full_url}" if ENV['DEBUG']
    response = HTTParty.delete full_url,
      headers: {'Accept' => 'application/json'}
    puts response if ENV['DEBUG']
    response
  end

  def post url, body
    body[:auth_token] = ENV['SCHATTER_AUTH_TOKEN']
    puts "POST #{url} #{body.to_json}" if ENV['DEBUG']
    response = HTTParty.post url,
      headers: {'Accept' => 'application/json', 'Content-Type' => 'application/json'},
      body: body.to_json
    puts response if ENV['DEBUG']
    response
  end
end
