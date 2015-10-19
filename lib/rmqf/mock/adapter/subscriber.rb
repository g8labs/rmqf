module Rmqf

  module Mock

    module Adapter

      class Subscriber < Base

        def required_keys
          ['id', 'resource', 'msisdn', 'active', 'subscriptionVia', 'weekday', 'subscribedAt', 'unsubscribedAt', 'subscription']
        end

      end

    end

  end

end
