require "google/api_client"

class GoogleService
  def initialize
    name = Rails.application.class.to_s
    version = "1"
    issuer = Rails.application.secrets.ga_client_email
    key_path = Rails.root.join("config", "google_service_key.p12").to_s
    passphrase = Rails.application.secrets.ga_passphrase
    scope = ["https://www.googleapis.com/auth/analytics.readonly"]

    @client = Google::APIClient.new(application_name: name,
                                    application_version: version)

    key = Google::APIClient::PKCS12.load_key(key_path, passphrase)
    service_account = Google::APIClient::JWTAsserter.new(issuer, scope, key)
    @client.authorization = service_account.authorize
  end

  def access_token
    response = @client.authorization.fetch_access_token!
    response["access_token"]
  end
end
