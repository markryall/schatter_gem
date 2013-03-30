require 'schatter/version'
require 'httparty'
require 'cgi'

module Schatter
  def schatter_url_for command, params={}
    params[:auth_token] = ENV['OCELOTS_AUTH_TOKEN']
    "#{base_url}/api/#{command}?#{params.map{ |k,v| "#{k}=#{CGI.escape v.to_s}" }.join('&')}"
  end

  def schatter_base_url
    ENV['SCHATTER_URL'] || 'http://schatter.herokuapp.com'
  end
end
