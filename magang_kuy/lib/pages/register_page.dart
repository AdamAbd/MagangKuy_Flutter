part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController goalController = TextEditingController(text: '');

  final formKey = GlobalKey<FormState>();
  final contentPadding = EdgeInsets.only(left: 28.0, bottom: 20.0, top: 20.0);

  bool isLoading = false, obscureText = true;

  File image;
  final picker = ImagePicker();

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  Future galleryImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedFile.path);
    });
    String name = pickedFile.path.split('/').last;
    print(image);
    print(name);
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
            Text(
              'Sign Up',
              style: greyTextStyle.copyWith(fontSize: 16.0),
            ),
            SizedBox(height: 2.0),
            Text(
              'Begin New Journey',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget inputImage() {
      return Center(
        child: GestureDetector(
          onTap: () async {
            await galleryImage();
          },
          child: Container(
            width: 120.0,
            height: 120.0,
            margin: EdgeInsets.only(top: 50.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: primaryColor),
              image: DecorationImage(
                image: image == null
                    ? AssetImage('assets/icon_user.png')
                    : FileImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    }

    Widget inputName() {
      return Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: greyTextStyle.copyWith(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: nameController,
              cursorColor: primaryColor,
              onChanged: (value) {
                setState(() {});
              },
              validator: MaxLengthValidator(
                12,
                errorText: 'Username cannot be more than 12 digits',
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
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
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

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(top: 20.0),
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
              textInputAction: TextInputAction.next,
              onEditingComplete: () => node.nextFocus(), // Move focus to next
              style: blueTextStyle,
            ),
          ],
        ),
      );
    }

    Widget inputGoal() {
      return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Goal',
              style: greyTextStyle.copyWith(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: goalController,
              cursorColor: primaryColor,
              onChanged: (value) {
                setState(() {});
              },
              validator: RequiredValidator(errorText: 'Goal is required'),
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
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
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

    Widget signUpButton() {
      return Container(
        margin: EdgeInsets.only(top: 40.0),
        height: 45.0,
        width: double.infinity,
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : TextButton(
                onPressed: () async {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      nameController.text.isEmpty ||
                      goalController.text.isEmpty) {
                    showError('Please fill all fields');
                  } else {
                    setState(() {
                      isLoading = true;
                    });

                    AuthModel auth = await authProvider.register(
                      emailController.text,
                      passwordController.text,
                      nameController.text,
                      goalController.text,
                      image,
                    );

                    UserModel user = await authProvider.me(auth.accessToken);

                    setState(() {
                      isLoading = false;
                    });

                    if (user == null) {
                      showError('User already exists with this email');
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
                  'Sign Up',
                  style: whiteTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
      );
    }

    Widget signInButton() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-in');
            },
            child: Text(
              'I Already Have An Account',
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
                  inputImage(),
                  inputName(),
                  inputEmail(),
                  inputPassword(),
                  inputGoal(),
                  signUpButton(),
                  signInButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
