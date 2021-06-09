part of 'pages.dart';

class CategoryPage extends StatelessWidget {
  final CategoryModel category;

  CategoryPage(this.category);

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);

    Widget appBar() {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      );
    }

    Widget header() {
      return Container(
        height: 270.0,
        width: double.infinity,
        padding: EdgeInsets.only(left: defaultMargin, bottom: 30.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(universalUrl + category.picturePath),
          ),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.name,
              style: whiteTextStyle.copyWith(
                fontSize: 20.0,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              '12,309 available',
              style: whiteTextStyle.copyWith(fontSize: 16.0),
            ),
          ],
        ),
      );
    }

    Widget companies() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 30.0,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Big Companies',
              style: blackTextStyle.copyWith(
                fontSize: 18.0,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: defaultMargin),
            FutureBuilder<List<JobModel>>(
              future: jobProvider.getJobsByCategory(category.name),
              builder: (context, snapshot) {
                print(snapshot.data);

                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: snapshot.data
                        .map(
                          (job) => JobTile(job),
                        )
                        .toList(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      );
    }

    Widget newStartups() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 20.0,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Just Posted',
              style: blackTextStyle.copyWith(
                fontSize: 18.0,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: defaultMargin),
            FutureBuilder<List<JobModel>>(
              future: jobProvider.getJobs(),
              builder: (context, snapshot) {
                print(snapshot.data);

                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: snapshot.data
                        .map(
                          (job) => JobTile(job),
                        )
                        .toList(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            companies(),
            newStartups(),
          ],
        ),
      ),
    );
  }
}
