module Rmqf

  module Mock

    class API

      attr_accessor :datastore

      def initialize(datastore)
        @datastore = datastore
      end

      def get_carriers
        datastore.get_carriers
      end

      def get_subscription(subscription_id)
        datastore.get_subscriptions.find { |x| x['id'] == subscription_id }
      end

      def create_subscriber(subscription_id, msisdn, subscription_via = nil)
        subscriber_id = rand(9999999)
        subscription = get_subscription(subscription_id)

         {
           "id" => 179712,
           "resource" => "http://mqf.globalnetmobile.com/v1/subscribers/#{subscriber_id}",
           "msisdn" => msisdn,
           "active" => true,
           "subscriptionVia" => "mqf:wap",
           "weekday" => 0,
           "subscribedAt" => Time.now.to_i,
           "unsubscribedAt" => 0,
           "subscription" => subscription
         }
      end

      def get_subscriber(subscription_id, msisdn)
        datastore.get_subscriptions.find { |x| x['msisdn'] == msisdn && x['subscription']['id'] == subscription_id }
      end

      def delete_subscriber(subscription_id, msisdn)
      end

      def send_message(carrier_id, shortcode, msisdn, body)
        {
          "id" => rand(9999999),
          "status" => "OK",
          "externalId" => rand(9999999),
          "carrier_id" => carrier_id,
          "shortcode" => shortcode.to_s,
          "msisdn" => msisdn,
          "body" => body
        }
      end

      def create_publication(subscription_id, message, notification_url, start_time = nil)
        publication_id = rand(9999999)
        subscription = get_subscription(subscription_id)

        {
          "id" => publication_id,
          "resource" => "http://mqf.globalnetmobile.com/v1/subscriptions/#{subscription_id}/publications/#{publication_id}",
          "status" => 0,
          "text" =>  message,
          "notificationUrl" => "http://example.com/notification",
          "submitTime" => Time.now.to_i,
          "startTime" => Time.now.to_i,
          "subscription" => subscription
        }
      end

    end

  end

end
