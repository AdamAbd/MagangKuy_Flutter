part of 'providers.dart';

class AuthProvider with ChangeNotifier {
  Future<AuthModel> register(
    String email,
    String password,
    String name,
    String goal,
    File image,
  ) async {
    try {
      final uri = Uri.parse(universalUrl + 'api/register');

      var request = http.MultipartRequest('POST', uri)
        ..fields['email'] = email
        ..fields['password'] = password
        ..fields['name'] = name
        ..fields['goal'] = goal;

      if (image != null) {
        var pic = await http.MultipartFile.fromPath('picture_path', image.path);
        request.files.add(pic);
        print(request);
      } else {
        print(request);
      }

      var response = await request.send();
      print('Register: ${response.statusCode}');
      print('Register: $response}');

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var data = jsonDecode(responseBody);
        print('Uploaded: $data');
        return AuthModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AuthModel> login(
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
        return AuthModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print('Login: $e');
      return null;
    }
  }

  Future me(String token) async {
    var head = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      var response = await http.post(
        Uri.parse(universalUrl + 'api/user/index'),
        headers: head,
      );

      print('Me: ${response.statusCode}');
      print('Me: ${response.body}');

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print('Me: $e');
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
        Uri.parse(universalUrl + 'api/user/logout'),
        headers: head,
      );

      print('Logout: ${response.statusCode}');
      print('Logout: ${response.body}');

      return null;
    } catch (e) {
      print('Logout: $e');
      return null;
    }
  }
}
