module Rmqf

  module Mock

    module Adapter

      class Subscription < Base

        def required_keys
          ['id', 'resource', 'name', 'keyword', 'type', 'periodicity', 'status', 'billingType', 'price', 'shortcode', 'senderShortcode', 'carrier']
        end

      end

    end

  end

end
