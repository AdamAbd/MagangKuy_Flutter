part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  final formKey = GlobalKey<FormState>();
  final contentPadding = EdgeInsets.only(left: 28.0, bottom: 20.0, top: 20.0);

  bool isLoading = false, obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    final node = FocusScope.of(context);

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: redColor,
        content: Text(message),
      ));
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign In', style: greyTextStyle.copyWith(fontSize: 16.0)),
            SizedBox(height: 2.0),
            Text(
              'Build Your Career',
              style: blackTextStyle.copyWith(
                fontSize: 24.0,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget illustration() {
      return Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Center(
          child: Image.asset('assets/image_sign_in.png', width: 260.0),
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: greyTextStyle.copyWith(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: emailController,
              cursorColor: primaryColor,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {});
              },
              validator: EmailValidator(
                errorText: 'Enter a valid email address',
              ),
              decoration: InputDecoration(
                contentPadding: contentPadding,
                fillColor: Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: primaryColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: '',
              ),
              textInputAction: TextInputAction.next,
              onEditingComplete: () => node.nextFocus(), // Move focus to next
              style: blueTextStyle,
            ),
          ],
        ),
      );
    }

    Widget inputPassword() {
      return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: greyTextStyle.copyWith(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: passwordController,
              cursorColor: primaryColor,
              obscureText: obscureText,
              onChanged: (value) {
                setState(() {});
              },
              validator: MinLengthValidator(
                8,
                errorText: 'Password must be at least 8 digits long',
              ),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    (obscureText == true)
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: toggle,
                ),
                contentPadding: contentPadding,
                fillColor: Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: primaryColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: '',
              ),
              textInputAction: TextInputAction.done,
              onEditingComplete: () => node.unfocus(), // Submit & hide keyboard
              style: blueTextStyle,
            ),
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        width: double.infinity,
        height: 45.0,
        margin: EdgeInsets.only(top: 40.0),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : TextButton(
                onPressed: () async {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    showError('Please fill all fields');
                  } else {
                    setState(() {
                      isLoading = true;
                    });

                    AuthModel auth = await authProvider.login(
                      emailController.text,
                      passwordController.text,
                    );

                    UserModel user = await authProvider.me(auth.accessToken);

                    setState(() {
                      isLoading = false;
                    });

                    if (user == null) {
                      showError('Email or Password is wrong');
                    } else {
                      userProvider.user = user;
                      userProvider.token = auth.accessToken;
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    }
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: whiteTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
      );
    }

    Widget signUpButton() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pop(context, '/sign-up');
            },
            child: Text(
              'Back To Sign Up',
              style: greyTextStyle.copyWith(fontWeight: light),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(),
                  illustration(),
                  inputEmail(),
                  inputPassword(),
                  signInButton(),
                  signUpButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
