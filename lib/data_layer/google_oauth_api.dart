/// The OAuth 2.0 Client ID given by Google Cloud.
const String clientId =
    "354034818654-ssi4dvpldjuam5ai9fvejvmrmme440ve.apps.googleusercontent.com";

/// The list of scopes that will be granted to the application
/// once the user authenticates with Google. This must align with
/// the scopes defined in the OAuth settings in the Google Cloud API Console.
const List<String> scopes = <String>[
  "email",
  "https://www.googleapis.com/auth/calendar.readonly",
  "https://www.googleapis.com/auth/calendar.events.owned.readonly",
];
