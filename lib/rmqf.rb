require 'rmqf/version'
require 'oauth'
require 'json'

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

end
