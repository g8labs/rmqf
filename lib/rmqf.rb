require 'rmqf/version'
require 'oauth'
require 'json'

require_relative 'oauth/custom_token'
require_relative 'rmqf/error'
require_relative 'rmqf/configuration'
require_relative 'rmqf/auth'
require_relative 'rmqf/api'

module Rmqf

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.clear_configuration
    configure do |c|
      c.consumer_key = nil
      c.consumer_secret = nil
      c.access_token = nil
      c.access_secret = nil
    end
  end

end
