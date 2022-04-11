# frozen_string_literal: true

module NgrokAPI
  module Models
    class AWSRole
      attr_reader :client,
        :attrs,
        :role_arn

      def initialize(client: nil, attrs: {})
        @client = client
        @attrs = attrs
        @role_arn = @attrs['role_arn']
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
