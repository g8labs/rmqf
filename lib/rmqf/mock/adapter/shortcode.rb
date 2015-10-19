module Rmqf

  module Mock

    module Adapter

      class Shortcode < Base

        def required_keys
          ['id', 'resource', 'number', 'description', 'services', 'hasCost', 'price']
        end

      end

    end

  end

end
