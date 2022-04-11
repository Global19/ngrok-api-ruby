# frozen_string_literal: true

module NgrokAPI
  module Models
    class EndpointBackendMutate
      attr_reader :client,
        :attrs,
        :enabled,
        :backend_id

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @enabled = @attrs['enabled']
        @backend_id = @attrs['backend_id']
      end

      def ==(other)
        @attrs == other.attrs
      end

      def to_s
        @attrs.to_s
      end

      def to_h
        @attrs.to_h
      end
    end
  end
end
