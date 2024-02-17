/// The OAuth 2.0 Client ID given by Google Cloud.
const String clientId = "662521222417-rsp71vrdsccq4mltkfcdmetd8973v95k.apps.googleusercontent.com";

/// The list of scopes that will be granted to the application
/// once the user authenticates with Google. This must align with
/// the scopes defined in the OAuth settings in the Google Cloud API Console.
const List<String> scopes = <String>[
  "email",
  "https://www.googleapis.com/auth/calendar.readonly",
  "https://www.googleapis.com/auth/calendar.events.owned.readonly",
];

