part of 'providers.dart';

class CategoryProvider with ChangeNotifier {
  Future<List<CategoryModel>> getCategories() async {
    try {
      var response = await http.get(
        Uri.parse(universalUrl + 'api/category'),
      );

      print('Category: ${response.statusCode}');
      print('Category: ${response.body}');

      if (response.statusCode == 200) {
        List<CategoryModel> categories = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((category) {
          categories.add(CategoryModel.fromJson(category));
        });

        return categories;
      } else {
        return [];
      }
    } catch (e) {
      print('Category Error: $e');
      return [];
    }
  }

  Future<List<CategoryModel>> createCategory(
      String name, File picturePath) async {
    String name = picturePath.path.split('/').last;

    var body = {
      'name': '$name',
      'picture_path': http.MultipartFile.fromPath(name, picturePath.path)
    };

    // var head = {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $token',
    // };

    try {
      var postUri = Uri.parse(universalUrl + 'api/category');
      var request = new http.MultipartRequest("POST", postUri);
      request.fields['name'] = 'blah';
      request.files.add(new http.MultipartFile.fromBytes(
        'file',
        await File.fromUri(Uri.parse(picturePath.path)).readAsBytes(),
      ));

      request.send().then((response) {
        if (response.statusCode == 200) print("Uploaded!");
      });
      // var response = await http.post(
      //   Uri.parse(universalUrl + 'api/category'),
      //   body: jsonEncode(body),
      //   // headers: head,
      // );

      // print('Category: ${request.statusCode}');
      // print('Category: ${response.body}');

      // if (response.statusCode == 200) {
      //   List<CategoryModel> categories = [];
      //   List parsedJson = jsonDecode(response.body);

      //   parsedJson.forEach((category) {
      //     categories.add(CategoryModel.fromJson(category));
      //   });

      //     return categories;
      //   } else {
      //     return [];
      //   }
    } catch (e) {
      print('Category Error: $e');
      return [];
    }
  }
}
