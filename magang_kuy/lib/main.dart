import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/pages.dart';
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
        // ChangeNotifierProvider<CategoryProvider>(
        //   create: (context) => CategoryProvider(),
        // ),
        // ChangeNotifierProvider<JobProvider>(
        //   create: (context) => JobProvider(),
        // ),
        // ChangeNotifierProvider<ApplicationProvider>(
        //   create: (context) => ApplicationProvider(),
        // ),
        // ChangeNotifierProvider<ApplyProvider>(
        //   create: (context) => ApplyProvider(),
        // ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ImagesProvider>(
          create: (context) => ImagesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Magang Kuy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
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
