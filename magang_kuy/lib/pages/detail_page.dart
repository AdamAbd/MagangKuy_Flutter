part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final JobModel job;
  DetailPage(this.job);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var applicationProvider = Provider.of<ApplicationProvider>(context);
    var applyProvider = Provider.of<ApplyProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 60,
        ),
        child: Column(
          children: [
            FutureBuilder<List<ApplicationModel>>(
              future: applicationProvider.getApply(
                widget.job.id,
                userProvider.user.id,
                userProvider.token,
              ),
              builder: (context, snapshot) {
                print("Get Apply: ${snapshot.data}");

                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: snapshot.data
                        .map(
                          (apply) => apply.apply == 'true'
                              ? Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(bottom: 30),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Color(0xffECEDF1),
                                  ),
                                  child: Text(
                                    'You have applied this job,\nthe recruiter will contact you shortly',
                                    textAlign: TextAlign.center,
                                    style: greyTextStyle.copyWith(),
                                  ),
                                )
                              : SizedBox(),
                        )
                        .toList(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            Image.network(
              universalUrl + widget.job.companyLogo,
              width: 60.0,
            ),
            SizedBox(height: 20.0),
            Text(
              widget.job.name,
              style: blackTextStyle.copyWith(
                fontSize: 18.0,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              '${widget.job.companyName} • ${widget.job.location}',
              style: greyTextStyle,
            ),
          ],
        ),
      );
    }

    Widget detailItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Icon(Icons.adjust, color: primaryColor, size: 12.0),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Text(
                text,
                style: blackTextStyle.copyWith(fontWeight: light),
              ),
            ),
          ],
        ),
      );
    }

    Widget descJob() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: blackTextStyle.copyWith(
                fontSize: 18.0,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.job.description,
              style: blackTextStyle.copyWith(fontWeight: light),
            ),
          ],
        ),
      );
    }

    Widget qualifications() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Qualifications',
              style: blackTextStyle.copyWith(
                fontSize: 18.0,
                fontWeight: medium,
              ),
            ),
            Column(
              children: widget.job.qualifications
                  .map((job) => detailItem(job.name))
                  .toList(),
            ),
          ],
        ),
      );
    }

    Widget responsibilities() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsibilities',
              style: blackTextStyle.copyWith(
                fontSize: 18.0,
                fontWeight: medium,
              ),
            ),
            Column(
              children: widget.job.responsibilities
                  .map((job) => detailItem(job.name))
                  .toList(),
            ),
          ],
        ),
      );
    }

    Widget applyButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 45,
            width: 200,
            child: TextButton(
              onPressed: () async {
                List<ApplicationModel> apply =
                    await applicationProvider.storeApply(
                  userProvider.user.id,
                  widget.job.id,
                  1,
                  userProvider.token,
                );

                print('True: $apply');

                applyProvider.apply = apply;
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(66),
                ),
              ),
              child: Text(
                'Apply for Job',
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget cancelButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 45,
            width: 200,
            child: TextButton(
              onPressed: () async {
                List<ApplicationModel> apply =
                    await applicationProvider.storeApply(
                  userProvider.user.id,
                  widget.job.id,
                  0,
                  userProvider.token,
                );

                applyProvider.apply = apply;
              },
              style: TextButton.styleFrom(
                backgroundColor: redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(66),
                ),
              ),
              child: Text(
                'Cancel Apply',
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget messageButton() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          bottom: 35,
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            '${widget.job.id}',
            style: greyTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            header(),
            descJob(),
            qualifications(),
            responsibilities(),
            FutureBuilder<List<ApplicationModel>>(
              future: applicationProvider.getApply(
                widget.job.id,
                userProvider.user.id,
                userProvider.token,
              ),
              builder: (context, snapshot) {
                print("Get Button Apply: ${snapshot.data}");

                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: snapshot.data
                        .map(
                          (apply) => apply.apply == 'true'
                              ? cancelButton()
                              : applyButton(),
                        )
                        .toList(),
                  );
                }
                return Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            ),
            messageButton(),
          ],
        ),
      ),
    );
  }
}
