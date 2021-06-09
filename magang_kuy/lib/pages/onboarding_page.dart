part of 'pages.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget content() {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/onboarding.jpg',
                width: 294.0,
                height: 324.0,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 40),
              Text(
                'Searching Jobs',
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w800,
                    color: primaryColor,
                    fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              Text(
                'No need to worry about how hard\nfor you to search a job.\nStart it now.',
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w400,
                    color: primaryColor,
                    fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      );
    }

    Widget button() {
      return Container(
        width: 140.0,
        height: 45.0,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/sign-up');
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            'Get Started',
            style: whiteTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              content(),
              button(),
            ],
          ),
        ),
      ),
    );
  }
}
// class OnboardingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Widget backgroundImage() {
//       return Image.asset(
//         'assets/onboarding.png',
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         fit: BoxFit.fill,
//       );
//     }

//     Widget content() {
//       return SafeArea(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           padding: EdgeInsets.symmetric(
//             horizontal: 30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 50,
//               ),
//               Text(
//                 'Build Your Next\nFuture Career Like\na Master',
//                 style: whiteTextStyle.copyWith(
//                   fontSize: 32,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 '18,000 jobs available',
//                 style: whiteTextStyle.copyWith(
//                   fontWeight: light,
//                 ),
//               ),
//               Spacer(),
//               Center(
//                 child: Container(
//                   width: 200,
//                   height: 45,
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/sign-up');
//                     },
//                     style: TextButton.styleFrom(
//                       backgroundColor: whiteColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(66),
//                       ),
//                     ),
//                     child: Text(
//                       'Get Started',
//                       style: purpleTextStyle.copyWith(
//                         fontWeight: medium,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               Center(
//                 child: Container(
//                   width: 200,
//                   height: 45,
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/sign-in');
//                     },
//                     style: TextButton.styleFrom(
//                       backgroundColor: transparentColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(66),
//                         side: BorderSide(
//                           color: whiteColor,
//                         ),
//                       ),
//                     ),
//                     child: Text(
//                       'Sign In',
//                       style: whiteTextStyle.copyWith(
//                         fontWeight: medium,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       body: Stack(
//         children: [
//           backgroundImage(),
//           content(),
//         ],
//       ),
//     );
//   }
// }
