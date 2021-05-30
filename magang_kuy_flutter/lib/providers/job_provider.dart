part of 'providers.dart';

class JobProvider with ChangeNotifier {
  Future<List<JobModel>> getJobs() async {
    try {
      var response = await http.get(
        Uri.parse(universalUrl + 'api/job'),
      );

      print('Job: ${response.statusCode}');
      print('Job: ${response.body}');

      if (response.statusCode == 200) {
        List<JobModel> categories = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((category) {
          categories.add(JobModel.fromJson(category));
        });

        return categories;
      } else {
        return [];
      }
    } catch (e) {
      print('Job Error: $e');
      return [];
    }
  }

  Future<List<JobModel>> getJobsByCategory(String category) async {
    try {
      var response = await http.get(
        Uri.parse(universalUrl + 'api/job/by?category=$category'),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((job) {
          jobs.add(JobModel.fromJson(job));
        });

        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
