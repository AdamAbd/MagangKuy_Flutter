part of 'providers.dart';

class ImagesProvider with ChangeNotifier {
  File _image;
  final picker = ImagePicker();

  File get image => _image;

  set image(File newImage) {
    _image = image;
    notifyListeners();
  }

  Future galleryImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    _image = File(pickedFile.path);
    String name = pickedFile.path.split('/').last;
    print(_image);
    print(name);
    notifyListeners();
  }

  Future<List<CategoryModel>> uploadImage(String token) async {
    try {
      final uri = Uri.parse(universalUrl + 'api/category');
      var request = http.MultipartRequest('POST', uri)
        ..headers['Content-Type'] = 'application/json'
        ..headers['Authorization'] = 'Bearer $token'
        ..fields['name'] = 'Flutter 2 Pake token Nich';
      var pic = await http.MultipartFile.fromPath('picture_path', image.path);
      request.files.add(pic);
      print(request);

      var response = await request.send();
      print(response.statusCode);
      // print(response.stream.bytesToString());
      print(response.statusCode);
      print(response);
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var data = jsonDecode(responseBody);
        print('Uploaded: $data');

        List<CategoryModel> categories = [];
        List parsedJson = jsonDecode(responseBody);

        parsedJson.forEach((category) {
          categories.add(CategoryModel.fromJson(category));
        });

        return categories;
      } else {
        print('Not Uploaded!');
        return [];
      }
    } catch (e) {
      print('$e');
      return [];
    }
  }

  // Future uploadImage(String token) async {
  //   try {
  //     final uri = Uri.parse(universalUrl + 'api/category');
  //     var request = http.MultipartRequest('POST', uri)
  //       ..headers['Content-Type'] = 'application/json'
  //       ..headers['Authorization'] = 'Bearer $token'
  //       ..fields['name'] = 'Flutter 2 Pake token Nich';
  //     var pic = await http.MultipartFile.fromPath('picture_path', image.path);
  //     request.files.add(pic);
  //     print(request);

  //     var response = await request.send();
  //     print(response.statusCode);
  //     print(response);
  //     if (response.statusCode == 200) {
  //       List<CategoryModel> categories = [];
  //       List parsedJson = jsonDecode(response.stream.toString());

  //       parsedJson.forEach((category) {
  //         categories.add(CategoryModel.fromJson(category));
  //       });

  //       return categories;
  //     } else {
  //       print('Not Uploaded!');
  //     }
  //   } catch (e) {
  //     print('$e');
  //   }
  // }
}
