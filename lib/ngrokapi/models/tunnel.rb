# frozen_string_literal: true

module NgrokAPI
  module Models
    class Tunnel
      attr_reader :client,
        :attrs,
        :id,
        :public_url,
        :started_at,
        :metadata,
        :proto,
        :region,
        :tunnel_session,
        :endpoint,
        :labels,
        :backends,
        :forwards_to

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @id = @attrs['id']
        @public_url = @attrs['public_url']
        @started_at = @attrs['started_at']
        @metadata = @attrs['metadata']
        @proto = @attrs['proto']
        @region = @attrs['region']
        @tunnel_session = @attrs['tunnel_session']
        @endpoint = @attrs['endpoint']
        @labels = @attrs['labels']
        @backends = @attrs['backends']
        @forwards_to = @attrs['forwards_to']
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
