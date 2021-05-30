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
}
