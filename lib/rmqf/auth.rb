module Rmqf

  module Auth

    def request(verb, uri, params = {})
      JSON.parse(token.request(verb, uri, params).body)
    end

    private

    attr_accessor :consumer, :token

    def setup_oauth(configuration, host)
      @consumer = OAuth::Consumer.new(@configuration.consumer_key, @configuration.consumer_secret,
                                      site: host)
      @token = OAuth::AccessToken.new(@consumer, @configuration.access_token,
                                      @configuration.access_secret)
    end

  end

end
