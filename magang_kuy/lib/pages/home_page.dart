part of 'pages.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo,',
              style: greyTextStyle.copyWith(
                fontSize: 20.0,
                fontWeight: semiBold,
              ),
            ),
            Container(
              width: 230.0,
              child: Text(
                userProvider.user.name + '!',
                maxLines: 1,
                overflow: TextOverflow.fade,
                softWrap: false,
                style: blackTextStyle.copyWith(
                  fontSize: 30.0,
                  fontWeight: extraBold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget allCategories() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 28.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Text(
              'All Categories',
              style: blackTextStyle.copyWith(
                fontSize: 18.0,
                fontWeight: medium,
              ),
            ),
          ),
          SizedBox(
            height: 18.0,
          ),
          Container(
            height: 200.0,
            child: FutureBuilder<List<CategoryModel>>(
              future: categoryProvider.getCategories(),
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.connectionState == ConnectionState.done) {
                  int index = -1;
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.map((category) {
                      index++;

                      return Container(
                        margin: EdgeInsets.only(
                            left: index == 0 ? defaultMargin : 0),
                        child: CategoryCard(category),
                      );
                    }).toList(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      );
    }

    Widget justPosted() {
      return Container(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30.0,
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
            SizedBox(height: 24.0),
            FutureBuilder<List<JobModel>>(
              future: jobProvider.getJobs(),
              builder: (context, snapshot) {
                print(snapshot.data);

                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: snapshot.data.map((job) => JobTile(job)).toList(),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [header(), allCategories(), justPosted()],
          ),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var categoryProvider = Provider.of<CategoryProvider>(context);
//     var jobProvider = Provider.of<JobProvider>(context);
//     var authProvider = Provider.of<AuthProvider>(context);
//     var userProvider = Provider.of<UserProvider>(context);

//     Widget header() {
//       return Container(
//         margin: EdgeInsets.only(
//           top: 30,
//           left: defaultMargin,
//           right: defaultMargin,
//         ),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Halo',
//                       style: greyTextStyle.copyWith(
//                         fontSize: 16,
//                       ),
//                     ),
//                     Container(
//                       width: 230.0,
//                       child: Text(
//                         userProvider.user.name,
//                         maxLines: 1,
//                         overflow: TextOverflow.fade,
//                         softWrap: false,
//                         style: blackTextStyle.copyWith(
//                           fontSize: 24,
//                           fontWeight: semiBold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 InkWell(
// onTap: () async {
//   await authProvider.logout(userProvider.token);
//   Navigator.pushNamedAndRemoveUntil(
//       context, '/onboarding', (route) => false);
// },
//                   child: Container(
//                     width: 58,
//                     height: 58,
//                     padding: EdgeInsets.all(4),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: primaryColor,
//                       ),
//                       image: DecorationImage(
//                         image: NetworkImage(
//                           universalUrl + userProvider.user.picturePath,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       );
//     }

//     Widget allCategories() {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 30,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: defaultMargin,
//             ),
//             child: Text(
//               'All Categories',
//               style: blackTextStyle.copyWith(
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 16,
//           ),
//           Container(
//             height: 200,
//             child: FutureBuilder<List<CategoryModel>>(
//               future: categoryProvider.getCategories(),
//               builder: (context, snapshot) {
//                 print(snapshot.data);

//                 if (snapshot.connectionState == ConnectionState.done) {
//                   int index = -1;

//                   return ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: snapshot.data.map((category) {
//                       index++;

//                       return Container(
//                         margin: EdgeInsets.only(
//                             left: index == 0 ? defaultMargin : 0),
//                         child: CategoryCard(category),
//                       );
//                     }).toList(),
//                   );
//                 }
//                 return Center(child: CircularProgressIndicator());
//               },
//             ),
//           ),
//         ],
//       );
//     }

//     Widget justPosted() {
//       return Container(
//         padding: EdgeInsets.only(
//           left: defaultMargin,
//           right: defaultMargin,
//           top: 30,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Just Posted',
//               style: blackTextStyle.copyWith(
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(
//               height: 24,
//             ),
//             FutureBuilder<List<JobModel>>(
//               future: jobProvider.getJobs(),
//               builder: (context, snapshot) {
//                 print(snapshot.data);

//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return Column(
//                     children: snapshot.data
//                         .map(
//                           (job) => JobTile(job),
//                         )
//                         .toList(),
//                   );
//                 }
//                 return Center(child: CircularProgressIndicator());
//               },
//             ),
//           ],
//         ),
//       );
//     }

//     Widget body() {
//       return ListView(
//         children: [
//           header(),
//           allCategories(),
//           justPosted(),
//         ],
//       );
//     }

//     Widget bottomNavBar() {
//       return BottomNavigationBar(
//         elevation: 0,
//         items: [
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icon_home.png',
//               width: 24,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icon_notification.png',
//               width: 24,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icon_love.png',
//               width: 24,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icon_user.png',
//               width: 24,
//             ),
//             label: '',
//           ),
//         ],
//       );
//     }

//     return Scaffold(
//       bottomNavigationBar: bottomNavBar(),
//       body: body(),
//     );
//   }
// }
