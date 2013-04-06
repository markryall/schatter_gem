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
    send_request verb, full_url
  end

  def post url, body
    body[:auth_token] = ENV['SCHATTER_AUTH_TOKEN']
    send_request :post, url,
        headers: {'Content-Type' => 'application/json'},
        body: body.to_json
  end

  def send_request verb, url, params={}
    show_request verb, url, params[:body]
    params[:headers] ||= {}
    params[:headers]['Accept'] = 'application/json'
    start = Time.now
    begin
      HTTParty.send(verb, url, params).tap do |response|
        show_response response, Time.now - start
      end
    rescue SocketError
      puts 'Could not contact host - are you sure the url is correct and you have a network connection?'
    end
  end

  def show_request verb, url, body=nil
    return unless ENV['DEBUG']
    puts [
      c(verb, :magenta),
      c(url, :red)
    ].join(' ')
    puts [
      'request: ',
      c(body, :yellow)
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