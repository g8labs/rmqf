module Rmqf

  module Mock

    module Adapter

      class Carrier < Base

        def required_keys
          ['id', 'resource', 'name', 'country']
        end

      end

    end

  end

end
