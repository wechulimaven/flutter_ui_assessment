// ignore_for_file: constant_identifier_names

class Constants {
  static const String GIPHY_API_KEY = 'nfDZKBa6WkwBsJlB2HrXJ5gvOBk9bt6o';
  static const String FCM_SERVER_KEY =
      'AAAAAHQT5q8:APA91bHMYHo960FAkLz7QcmO-C58DbEdn6NZGX0EzsuCUM5xuIewdLMva_6wVqbu4YnjMk4XbZ2VqSGHlVKBgEdt8z4Ccy7mxLQMXd6WCzMnrPYGSqkC-8CTK304oyvcDVx2WWDlWn-C';
  static const kShortPassError = "Your passworf is too short";
}

class FirestoreConstants {
  static const String pathNotificationsCollection = "notification";
}

///platforms
const int androidPlatform = 1;
const int iOSPlatform = 2;
const int otherPlatform = -1;

String languageKey = "languageKey";

List<String> getFavCountries() {
  return ['+254', 'KE'];
}
