part of 'widgets.dart';

class JobTile extends StatelessWidget {
  final JobModel job;

  JobTile(this.job);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(job),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 100.0,
        margin: EdgeInsets.only(bottom: defaultMargin),
        decoration: BoxDecoration(
          color: Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 68.0,
              height: 68.0,
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                    universalUrl + job.companyLogo,
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              width: 210.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.companyName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: blackTextStyle.copyWith(
                      fontSize: 16.0,
                      fontWeight: regular,
                    ),
                  ),
                  Text(
                    job.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: blackTextStyle.copyWith(
                      fontSize: 18.0,
                      fontWeight: bold,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        job.salary,
                        style: blackTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: regular,
                        ),
                      ),
                      Container(
                        width: 60.0,
                        height: 18.0,
                        margin: EdgeInsets.only(right: 16.0),
                        decoration: BoxDecoration(
                          color: yellowColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            'Part-time',
                            style: blackTextStyle.copyWith(
                              fontSize: 10.0,
                              fontWeight: regular,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
