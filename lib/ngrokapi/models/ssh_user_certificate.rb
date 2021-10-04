# frozen_string_literal: true

module NgrokAPI
  module Models
    class SSHUserCertificate
      attr_reader :client,
        :result,
        :id,
        :uri,
        :created_at,
        :description,
        :metadata,
        :public_key,
        :key_type,
        :ssh_certificate_authority_id,
        :principals,
        :critical_options,
        :extensions,
        :valid_after,
        :valid_until,
        :certificate

      def initialize(client:, result:)
        @client = client
        @result = result
        @id = @result['id']
        @uri = @result['uri']
        @created_at = @result['created_at']
        @description = @result['description']
        @metadata = @result['metadata']
        @public_key = @result['public_key']
        @key_type = @result['key_type']
        @ssh_certificate_authority_id = @result['ssh_certificate_authority_id']
        @principals = @result['principals']
        @critical_options = @result['critical_options']
        @extensions = @result['extensions']
        @valid_after = @result['valid_after']
        @valid_until = @result['valid_until']
        @certificate = @result['certificate']
      end

      def ==(other)
        @result == other.result
      end

      def to_s
        @result.to_s
      end

      ##
      # Delete an SSH User Certificate
      #
      # https://ngrok.com/docs/api#api-ssh-user-certificates-delete
      def delete
        @client.delete(
          id: @id
        )
      end

      ##
      # Update an SSH User Certificate
      #
      # https://ngrok.com/docs/api#api-ssh-user-certificates-update
      def update(
        description: nil,
        metadata: nil
      )
        @description = description if description
        @metadata = metadata if metadata
        @client.update(
          id: @id,
          description: description,
          metadata: metadata
        )
      end
    end
  end
end