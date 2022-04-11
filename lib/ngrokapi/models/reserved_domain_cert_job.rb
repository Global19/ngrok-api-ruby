# frozen_string_literal: true

module NgrokAPI
  module Models
    class ReservedDomainCertJob
      attr_reader :client,
        :attrs,
        :error_code,
        :msg,
        :started_at,
        :retries_at

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @error_code = @attrs['error_code']
        @msg = @attrs['msg']
        @started_at = @attrs['started_at']
        @retries_at = @attrs['retries_at']
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
