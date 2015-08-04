module Rmqf

  module Auth

    def request(verb, uri, params = {})
      response = token.request(verb, uri, params.to_json, { 'Content-Type' => 'application/json' })

      case response
      when Net::HTTPSuccess
        JSON.parse response.body
      else
        raise Error, response
      end
    end

    private

    attr_accessor :consumer, :token

    def setup_oauth(configuration, host)
      @consumer = OAuth::Consumer.new(@configuration.consumer_key, @configuration.consumer_secret,
                                      site: host)
      @token = OAuth::CustomToken.new(@consumer, @configuration.access_token,
                                      @configuration.access_secret)
    end

  end

end
