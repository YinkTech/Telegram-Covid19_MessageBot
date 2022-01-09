require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot'

class Data
  @values = nil

  def initialize
    @values = make_the_request
  end

  def make_the_request
    url = 'https://api.covid19api.com/dayone/country/nigeria'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def select_current
    @values = @values.last
    @values
  end
end
