import "/data_layer/google_oauth_api.dart";

/// Returns the OAuth 2.0 Client ID to be used for Google authentication.
String getClientId() {
  return clientId;
}

/// Returns the access scopes to be used for Google authentication.
List<String> getScopes() {
  return scopes;
}
