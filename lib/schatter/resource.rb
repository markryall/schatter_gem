require 'httparty'
require 'cgi'
require 'schatter/colour'

class Schatter::Resource
  include Schatter::Colour

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
    @links
  end

  def uuid
    resource['uuid']
  end

  def timestamp
    Time.at resource['timestamp']
  end

  def formatted_timestamp
    timestamp.strftime "%d/%m/%Y %H:%M:%S"
  end

  def get url, params={}
    nonpost url, params, :get
  end

  def delete url, params={}
    nonpost url, params, :delete
  end

  def nonpost url, params, verb
    params[:auth_token] = ENV['SCHATTER_AUTH_TOKEN']
    full_url = "#{url}?#{params.map{ |k,v| "#{k}=#{CGI.escape v.to_s}" }.join('&')}"
    show_request verb, url
    send_request do
      HTTParty.send verb, full_url,
        headers: {'Accept' => 'application/json'}
    end
  end

  def post url, body
    body[:auth_token] = ENV['SCHATTER_AUTH_TOKEN']
    show_request :post, url, body
    send_request do
      HTTParty.post url,
        headers: {'Accept' => 'application/json', 'Content-Type' => 'application/json'},
        body: body.to_json
    end
  end

  def send_request
    start = Time.now
    yield.tap {|response| show_response response, Time.now - start}
  end

  def show_request verb, url, body=nil
    return unless ENV['DEBUG']
    puts [
      c(verb, :magenta),
      c(url, :red)
    ].join(' ')
    puts [
      'request: ',
      c(body.to_json, :yellow)
    ].join(' ') if body
  end

  def show_response response, duration
    return unless ENV['DEBUG']
    puts [
      'response: ',
      c(response, :yellow)
    ].join(' ')
    puts c("#{duration} seconds",:green)
  end
end