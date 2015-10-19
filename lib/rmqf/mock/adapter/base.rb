module Rmqf

  module Mock

    module Adapter

      class Base

        # Generates a representation of the Object to be adapted. This representation
        # should be the same as GlobelNet's mqf representations.
        #
        # @return [Hash] Hash representation of the object
        def to_rmqf
          # Get the rmqf representation from the super class adapter
          representation = mqf_representation

          required_keys.flatten.each do |k|
            unless representation.keys.include?(k)
              raise ArgumentError.new("Missing key: #{k.inspect}. Required keys are: #{required_keys.map(&:inspect).join(', ')}")
            end
          end

          # return the valid representation
          representation
        end

        def required_keys
          fail "Abstract method #{__method__}"
        end

      end

    end

  end

end
