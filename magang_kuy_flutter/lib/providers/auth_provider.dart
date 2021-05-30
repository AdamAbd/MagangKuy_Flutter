part of 'providers.dart';

class AuthProvider with ChangeNotifier {
  Future<UserModel> register(
    String email,
    String password,
    String name,
  ) async {
    try {
      var body = {
        'email': email,
        'password': password,
        'name': name,
      };

      var response = await http.post(
        Uri.parse(universalUrl + 'api/register'),
        body: body,
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel> login(
    String email,
    String password,
  ) async {
    try {
      var body = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse(universalUrl + 'api/login'),
        body: body,
      );

      print('Login: ${response.statusCode}');
      print('Login: ${response.body}');

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print('Login: $e');
      return null;
    }
  }

  Future logout(String token) async {
    var head = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      var response = await http.post(
        Uri.parse(universalUrl + 'api/logout'),
        headers: head,
      );

      print('Apply2: ${response.statusCode}');
      print('Apply2: ${response.body}');

      return null;
    } catch (e) {
      print('Login: $e');
      return null;
    }
  }
}
