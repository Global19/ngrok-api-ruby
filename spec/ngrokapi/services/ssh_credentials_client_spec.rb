require 'spec_helper'

RSpec.describe NgrokAPI::Services::SSHCredentialsClient do
  let(:base_url) { 'https://api.ngrok.com' }
  let(:path) { '/ssh_credentials' }
  let(:not_found) do
    NgrokAPI::Errors::NotFoundError.new(response: ssh_credential_result)
  end

  before(:each) do
    @client = class_double("HttpClient")
    @ssh_credentials_client = NgrokAPI::Services::SSHCredentialsClient.new(client: @client)
  end

  describe "#create" do
    it "will make a post request and return an instance of NgrokAPI::Models::SSHCredential" do
      path = '/ssh_credentials'
      replacements = {
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:acl] = "New acl"
      data[:public_key] = "New public_key"
      expect(@client).to receive(:post).with(path % replacements, data: data).
        and_return(ssh_credential_result)
      result = @ssh_credentials_client.create(
        description: "New description",
        metadata: "New metadata",
        acl: "New acl",
        public_key: "New public_key"
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHCredential)
      # expect(result.id).to eq(ssh_credential_result["id"])
    end
  end

  describe "#delete" do
    it "will make a delete request" do
      path = '/ssh_credentials/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements).and_return(nil)
      @ssh_credentials_client.delete(
        id: api_key_result["id"]
      )
    end
  end

  describe "#delete!" do
    it "will make a delete request" do
      path = '/ssh_credentials/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect(@client).to receive(:delete).with(path % replacements, danger: true).and_return(nil)
      @ssh_credentials_client.delete!(
        id: api_key_result["id"]
      )
    end

    it "will make a delete request and return NotFoundError if 404" do
      path = '/ssh_credentials/%{id}'
      replacements = {
        id: api_key_result["id"],
      }
      expect do
        expect(@client).to receive(:delete).with(path % replacements, danger: true).
          and_raise(NgrokAPI::Errors::NotFoundError)
        result = @ssh_credentials_client.delete!(
          id: api_key_result["id"]
        )
        expect(result).to be nil
      end.to raise_error(NgrokAPI::Errors::NotFoundError)
    end
  end

  describe "#get" do
    it "will make a get request and return an instance of NgrokAPI::Models::SSHCredential" do
      path = '/ssh_credentials/%{id}'
      replacements = {
        id: ssh_credential_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(ssh_credential_result)
      result = @ssh_credentials_client.get(
        id: ssh_credential_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHCredential)
      # expect(result.id).to eq(ssh_credential_result["id"])
    end
  end

  describe "#get!" do
    it "will make a get request and return an instance of NgrokAPI::Models::SSHCredential" do
      path = '/ssh_credentials/%{id}'
      replacements = {
        id: ssh_credential_result["id"],
      }
      data = {}
      expect(@client).to receive(:get).with(path % replacements, data: data).
        and_return(ssh_credential_result)
      result = @ssh_credentials_client.get(
        id: ssh_credential_result["id"]
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHCredential)
      # expect(result.id).to eq(ssh_credential_result["id"])
    end
  end

  describe "#list" do
    it "will make a call to list (a GET request) and return a NgrokAPI::Models::Listable" do
      expect(@client).to receive(:list).
        and_return(ssh_credential_results)
      url = base_url + path + "?before_id=" + api_key_result["id"] + "&limit=1"
      result = @ssh_credentials_client.list(url: url)
      expect(result.class).to eq(NgrokAPI::Models::Listable)
    end
  end

  describe "#update" do
    it "will make a patch request and return an instance of NgrokAPI::Models::SSHCredential" do
      path = '/ssh_credentials/%{id}'
      replacements = {
        id: ssh_credential_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:acl] = "New acl"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(ssh_credential_result)
      result = @ssh_credentials_client.update(
        id: ssh_credential_result["id"],
        description: "New description",
        metadata: "New metadata",
        acl: "New acl"
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHCredential)
      # expect(result.id).to eq(ssh_credential_result["id"])
    end
  end

  describe "#update!" do
    it "will make a patch request and return an instance of NgrokAPI::Models::SSHCredential" do
      path = '/ssh_credentials/%{id}'
      replacements = {
        id: ssh_credential_result["id"],
      }
      data = {}
      data[:description] = "New description"
      data[:metadata] = "New metadata"
      data[:acl] = "New acl"
      expect(@client).to receive(:patch).with(path % replacements, data: data).
        and_return(ssh_credential_result)
      result = @ssh_credentials_client.update(
        id: ssh_credential_result["id"],
        description: "New description",
        metadata: "New metadata",
        acl: "New acl"
      )
      expect(result.class).to eq(NgrokAPI::Models::SSHCredential)
      # expect(result.id).to eq(ssh_credential_result["id"])
    end
  end
end
