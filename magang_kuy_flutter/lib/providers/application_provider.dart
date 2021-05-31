part of 'providers.dart';

class ApplicationProvider with ChangeNotifier {
  Future<List<ApplicationModel>> getApply(
      int jobId, int userId, String token) async {
    var body = {
      'user_id': '$userId',
      'job_id': '$jobId',
    };

    var head = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      var response = await http.post(
        Uri.parse(universalUrl + 'api/apply'),
        body: jsonEncode(body),
        headers: head,
      );

      print('Apply1: ${response.statusCode}');
      print('Apply1: ${response.body}');

      if (response.statusCode == 200) {
        List<ApplicationModel> categories = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((category) {
          categories.add(ApplicationModel.fromJson(category));
        });

        return categories;
      } else {
        return [];
      }
    } catch (e) {
      print('Apply 1 Error: $e');
      return [];
    }
  }

  Future<List<ApplicationModel>> storeApply(
      int userId, int jobId, int apply, String token) async {
    var body = {
      'user_id': '$userId',
      'job_id': '$jobId',
      'apply': '$apply',
    };

    var head = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      var response = await http.post(
        Uri.parse(universalUrl + 'api/apply/store'),
        body: jsonEncode(body),
        headers: head,
      );

      print('Apply2: ${response.statusCode}');
      print('Apply2: ${response.body}');

      if (response.statusCode == 200) {
        List<ApplicationModel> categories = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((category) {
          categories.add(ApplicationModel.fromJson(category));
        });

        return categories;
      } else {
        return [];
      }
    } catch (e) {
      print('Apply 2 Error: $e');
      return [];
    }
  }
}
