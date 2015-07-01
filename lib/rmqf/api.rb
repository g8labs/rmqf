module Rmqf

  class API

    include Auth

    HOST = 'http://mqf.globalnetmobile.com'

    attr_accessor :configuration

    def initialize(configuration = nil)
      @configuration = configuration || Rmqf.configuration

      setup_oauth(@configuration, HOST)
    end

    # Gets the carriers
    #
    # @return [Array<Hash>] The carriers list
    # @example
    #  {
    #     "total":3,
    #     "items":[
    #       {
    #         "id":16,
    #         "resource":"http:\/\/mqf.globalnetmobile.com\/v1\/carriers\/16",
    #         "name":"Ancel",
    #         "country":{
    #           "code":"UY"
    #         }
    #       },
    #       {
    #         "id":13,
    #         "resource":"http:\/\/mqf.globalnetmobile.com\/v1\/carriers\/13",
    #         "name":"Claro",
    #         "country":{
    #           "code":"UY"
    #         }
    #       },
    #       {
    #         "id":14,
    #         "resource":"http:\/\/mqf.globalnetmobile.com\/v1\/carriers\/14",
    #         "name":"Movistar",
    #         "country":{
    #           "code":"UY"
    #         }
    #       }
    #     ]
    #   }
    def get_carriers
      path = '/v1/carriers'

      request(:get, path)['items']

    end


    # Gets the subsctiption by the given id
    #
    # @param [Integer] subscription_id The subscription id
    # @return [Hash] The subscription
    # @example
    #   {
    #     "id":177,
    #     "resource":"http:\/\/mqf.globalnetmobile.com\/v1\/subscriptions\/177",
    #     "name":"Club WazzUp",
    #     "keyword":"JUEGOS",
    #     "type":"content",
    #     "periodicity":"w",
    #     "status":1,
    #     "billingType":"billing",
    #     "price":{
    #       "amount":10,
    #       "hasTax":true
    #     },
    #     "shortcode":{
    #       "id":8,
    #       "resource":"http:\/\/mqf.globalnetmobile.com\/v1\/shortcodes\/8",
    #       "number":"88288",
    #       "description":"Suscripciones Personal Argentina",
    #       "services":1,
    #       "hasCost":false,
    #       "price":null
    #     },
    #     "senderShortcode":null,
    #     "carrier":{
    #       "id":2,
    #       "resource":"http:\/\/mqf.globalnetmobile.com\/v1\/carriers\/2",
    #       "name":"Personal",
    #       "country":{
    #         "code":"AR",
    #         "name":"Argentina",
    #         "prefixCode":"54"
    #       }
    #     }
    #   }
    def get_subscription(subscription_id)
      path = "/v1/subscriptions/#{subscription_id}"

      request(:get, path)
    end

    # Adds a new subscriber to the given subscription
    #
    # @param [Integer] subscription_id The subscription id
    # @param [String] msisdn The user phone number
    # @param [String] subscription_via The subscription via, AKA billing type.
    # @return [Hash] The new subscriber
    # @example
    #
    #  {
    #    "id":179712,
    #    "resource":"http:\/\/mqf.globalnetmobile.com\/v1\/subscribers\/179712",
    #    "msisdn":"541100000000",
    #    "active":true,
    #    "subscriptionVia":"mqf:wap",
    #    "weekday":0,
    #    "subscribedAt":1433035939,
    #    "unsubscribedAt":0,
    #    "subscription":{
    #      "id":177,
    #      "resource":"http:\/\/mqf.globalnetmobile.com\/v1\/subscriptions\/177",
    #      "name":"Club WazzUp",
    #      "keyword":"JUEGOS",
    #      "type":"content",
    #      "periodicity":"w",
    #      "status":1,
    #      "billingType":"billing",
    #      "carrier":{
    #        "id":2
    #      }
    #    }
    #  }
    def create_subscriber(subscription_id, msisdn, subscription_via)
      path = "/v1/subscriptions/#{subscription_id}/subscribers"

      request(:post, path, msisdn: msisdn, subscriptionVia: subscription_via)
    end

    # Gets an active subscriber of the given subscription
    #
    # @param [Integer] subscription_id The subscription id
    # @param [String] msisdn The user phone number
    # @return [Hash] The new subscriber
    # @example
    #  {
    #    "id":173846,
    #    "resource":"http:\/\/mqf.globalnetmobile.com\/v1\/subscribers\/173846",
    #    "msisdn":"540000000004",
    #    "active":true,
    #    "weekday":3,
    #    "subscriptionVia":"sms",
    #    "subscribedAt":1417620846,
    #    "unsubscribedAt":null,
    #    "unsubscribedBy":null,
    #    "subscription":{
    #      "id":177,
    #      "resource":"http:\/\/mqf.globalnetmobile.com\/v1\/subscriptions\/177",
    #      "name":"Club WazzUp",
    #      "keyword":"JUEGOS",
    #      "type":"content",
    #      "periodicity":"w",
    #      "status":1,
    #      "billingType":"billing",
    #      "carrier":{
    #        "id":2
    #      }
    #    }
    #  }
    def get_subscriber(subscription_id, msisdn)
      path = "/v1/subscriptions/#{subscription_id}/subscribers/#{msisdn}"

      request(:get, path)
    end

    # Deletes the subscriber from the given subscription
    #
    # @param [Integer] subscription_id The subscription id
    # @param [String] msisdn The user phone number
    # @return [Hash] Empty hash if deleted succesfully, an error otherwise
    # @example
    #  {}
    def delete_subscriber(subscription_id, msisdn)
      path = "/v1/subscriptions/#{subscription_id}/subscribers/#{msisdn}"

      request(:delete, path)
    end

    # Sends a new message to the give number (msisdn)
    #
    # @param [Integer] carrier_id The carrier id
    # @param [String] shortcode The SMS short number
    # @param [String] msisdn The user phone number
    # @param [String] body The message content
    # @return [Hash] A new message
    # @example
    #   {
    #     "id":9649258,
    #     "status":"OK",
    #     "externalId":10151615,
    #     "carrier_id":14,
    #     "shortcode":"17571",
    #     "msisdn":"59894813751",
    #     "body":"Hola mundo"
    #   }
    def send_message(carrier_id, shortcode, msisdn, body)
      path = '/v1/messages/mt'

      request(:post, path, {
        carrier_id: carrier_id,
        shortcode: shortcode,
        msisdn: msisdn,
        body: body
      })
    end

  end

end
