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
                userProvider.user.user.id,
                userProvider.user.accessToken,
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
              width: 60,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.job.name,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
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
        margin: EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.adjust,
              color: primaryColor,
              size: 12,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                text,
                style: blackTextStyle.copyWith(
                  fontWeight: light,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget aboutJob() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About the job',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            Column(
              children:
                  widget.job.about.map((job) => detailItem(job.name)).toList(),
              // children: [
              //   detailItem(
              //     'Start at \$18,000 per month',
              //   ),
              // ],
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
                fontWeight: medium,
              ),
            ),
            Column(
              children: widget.job.qualification
                  .map((job) => detailItem(job.name))
                  .toList(),
              // children: [
              //   detailItem(
              //     'Candidate must possess at least a Bachelor\'s Degree.',
              //   ),
              //   detailItem(
              //     'Able to use Microsoft Office and Google based service.',
              //   ),
              //   detailItem(
              //     'Have an excellent time management, good at organized and details',
              //   ),
              // ],
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
                fontWeight: medium,
              ),
            ),
            Column(
              children: widget.job.responsibility
                  .map((job) => detailItem(job.name))
                  .toList(),
              // children: [
              //   detailItem(
              //     'Initiate and promote any programs, events, training, or activities.',
              //   ),
              //   detailItem(
              //     'Assessing and anticipating needs and collaborate with Division.',
              //   ),
              // ],
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
                  userProvider.user.user.id,
                  widget.job.id,
                  1,
                  userProvider.user.accessToken,
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
                  userProvider.user.user.id,
                  widget.job.id,
                  0,
                  userProvider.user.accessToken,
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
            aboutJob(),
            qualifications(),
            responsibilities(),
            FutureBuilder<List<ApplicationModel>>(
              future: applicationProvider.getApply(
                widget.job.id,
                userProvider.user.user.id,
                userProvider.user.accessToken,
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
