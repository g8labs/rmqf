module Rmqf

  module Mock

    class Datastore

      def get_subscriptions
        subscriptions.map(&:to_rmqf)
      end

      def get_subscribers
        subscribers.map(&:to_rmqf)
      end

      def get_carriers
        carriers.map(&:to_rmqf)
      end

      def get_shortcodes
        shortcodes.map(&:to_rmqf)
      end

      protected

      def subscriptions
        fail "Abstract method #{__method__}"
      end

      def subscribers
        fail "Abstract method #{__method__}"
      end

      def carriers
        fail "Abstract method #{__method__}"
      end

      def shortcodes
        fail "Abstract method #{__method__}"
      end

    end

  end

end
