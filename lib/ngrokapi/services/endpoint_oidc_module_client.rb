# frozen_string_literal: true

module NgrokAPI
  module Services
    ##
    # https://ngrok.com/docs/api#api-endpoint-oidc-module
    class EndpointOIDCModuleClient
      # The API path for the requests
      PATH = '/endpoint_configurations/%{id}/oidc'

      attr_reader :client

      def initialize(client:)
        @client = client
      end

      ##
      # @param [string] id
      # @param [EndpointOIDC] a_module
      # @return [NgrokAPI::Models::EndpointOIDC] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-oidc-module-replace
      def replace(
        id: "",
        a_module: nil
      )
        path = '/endpoint_configurations/%{id}/oidc'
        replacements = {
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data)
        NgrokAPI::Models::EndpointOIDC.new(client: self, result: result)
      end

      ##
      # @param [string] id
      # @param [EndpointOIDC] a_module
      # @return [NgrokAPI::Models::EndpointOIDC] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-oidc-module-replace
      def replace!(
        id: "",
        a_module: nil
      )
        path = '/endpoint_configurations/%{id}/oidc'
        replacements = {
          id: id,
        }
        data = {}
        data[:module] = a_module if a_module
        result = @client.put(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointOIDC.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointOIDC] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-oidc-module-get
      def get(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/oidc'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data)
        NgrokAPI::Models::EndpointOIDC.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::EndpointOIDC] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-oidc-module-get
      def get!(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/oidc'
        replacements = {
          id: id,
        }
        data = {}
        result = @client.get(path % replacements, data: data, danger: true)
        NgrokAPI::Models::EndpointOIDC.new(client: self, result: result)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-oidc-module-delete
      def delete(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/oidc'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements)
      end

      ##
      # @param [string] id a resource identifier
      # @return [NgrokAPI::Models::Empty] result from the API request
      #
      # https://ngrok.com/docs/api#api-endpoint-oidc-module-delete
      def delete!(
        id: ""
      )
        path = '/endpoint_configurations/%{id}/oidc'
        replacements = {
          id: id,
        }
        @client.delete(path % replacements, danger: true)
      end
    end
  end
end
