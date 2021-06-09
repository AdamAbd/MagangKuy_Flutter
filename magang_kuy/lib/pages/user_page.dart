part of 'pages.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    // Widget

    return Scaffold(
      body: Container(
        child: Center(
            child: GestureDetector(
          onTap: () async {
            setState(() {
              isLoading = true;
            });

            await authProvider.logout(userProvider.token);

            Navigator.pushNamedAndRemoveUntil(
                context, '/onboarding', (route) => false);

            setState(() {
              isLoading = false;
            });
          },
          child: Text("data"),
        )),
      ),
    );
  }
}
