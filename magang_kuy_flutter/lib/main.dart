import 'package:flutter/material.dart';
import 'package:magang_kuy_flutter/theme.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../pages/pages.dart';

import 'providers/providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<JobProvider>(
          create: (context) => JobProvider(),
        ),
        ChangeNotifierProvider<ApplicationProvider>(
          create: (context) => ApplicationProvider(),
        ),
        ChangeNotifierProvider<ApplyProvider>(
          create: (context) => ApplyProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Magang Kuy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          // '/': (context) => SplashPage(),
          '/onboarding': (context) => OnboardingPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MyHomePage(),
        },
        home: OnboardingPage(),
      ),
    );
  }
}

class MyHomeaPage extends StatefulWidget {
  @override
  _MyHomeaPageState createState() => _MyHomeaPageState();
}

class _MyHomeaPageState extends State<MyHomeaPage> {
  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);
    var applicationProvider = Provider.of<ApplicationProvider>(context);
    var applyProvider = Provider.of<ApplyProvider>(context);
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    bool isLoading = false;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: [
            FutureBuilder<List<ApplicationModel>>(
              future: applicationProvider.getApply(
                  1, 1, 'userProvider.user.accessToken'),
              builder: (context, snapshot) {
                print(snapshot.data);

                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: snapshot.data
                        .map(
                          (apply) => Column(
                            children: [
                              Text('${apply.userId}'),
                              Text(apply.apply == 'false' ? 'Yahh' : 'Noo'),
                            ],
                          ),
                        )
                        .toList(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            SizedBox(height: 20.0),
            Container(
              height: 45,
              width: double.infinity,
              margin: EdgeInsets.only(top: 40),
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-in');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(66),
                        ),
                      ),
                      child: Text(
                        'Sign In',
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ),
            ),
            SizedBox(height: 20.0),
            Container(
              height: 45,
              width: double.infinity,
              margin: EdgeInsets.only(top: 40),
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-up');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(66),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ),
            ),

            // Container(
            //   width: double.infinity,
            //   height: 60.0,
            //   margin: EdgeInsets.symmetric(horizontal: 24.0),
            //   color: Colors.white,
            //   child: TextButton(
            //     onPressed: () async {
            //       List<ApplicationModel> apply =
            //           await applicationProvider.storeApply(1, 8, 1);

            //       applyProvider.apply = apply;
            //     },
            //     child: Text('Coba'),
            //   ),
            // ),
            SizedBox(height: 20.0),
            // Column(
            //   children: applyProvider.apply.map((e) => Text(e.apply)).toList(),
            // )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final JobModel category;

  ListItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200.0,
        color: Colors.black,
        child: Center(
          child: Column(
            children: [
              Text(
                category.name,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: category.about
                    .map(
                      (e) => Text(
                        e.name.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: category.qualification
                    .map(
                      (e) => Text(
                        e.name.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LisatItem extends StatelessWidget {
  final JobModel category;

  LisatItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200.0,
        color: Colors.black,
        child: Center(
          child: Column(
            children: [
              Text(
                category.name,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: category.about
                    .map(
                      (e) => Text(
                        e.name.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: category.qualification
                    .map(
                      (e) => Text(
                        e.name.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
