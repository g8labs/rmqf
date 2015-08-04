module OAuth

  class CustomToken < AccessToken

    def request(http_method, path, *arguments)
      request_uri = URI.parse(path)
      site_uri = consumer.uri
      is_service_uri_different = (request_uri.absolute? && request_uri != site_uri)
      begin
        consumer.uri(request_uri) if is_service_uri_different
        @response = consumer.request(http_method, path, self, { token_request: true }, *arguments)
      ensure
        # NOTE: reset for wholesomeness? meaning that we admit only AccessToken service calls may use different URIs?
        # so reset in case consumer is still used for other token-management tasks subsequently?
        consumer.uri(site_uri) if is_service_uri_different
      end
      @response
    end
  end

end
