part of 'providers.dart';

class UserProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel newUser) {
    _user = newUser;
    notifyListeners();
  }

  String _token;

  String get token => _token;

  set token(String newtoken) {
    _token = newtoken;
    notifyListeners();
  }
}
