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
    // var imageProvider = Provider.of<ImagesProvider>(context);

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: redColor,
        content: Text(message),
      ));
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 2,
            ),
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
            width: 120,
            height: 120,
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: primaryColor),
              image: DecorationImage(
                image: image == null
                    ? AssetImage('assets/image_profile.png')
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
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nick Name',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: nameController,
              cursorColor: primaryColor,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 28, bottom: 20, top: 20),
                fillColor: Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: '',
              ),
              style: blueTextStyle,
            ),
          ],
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: emailController,
              cursorColor: primaryColor,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 28, bottom: 20, top: 20),
                fillColor: Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: email.EmailValidator.validate(emailController.text)
                        ? primaryColor
                        : Colors.red,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: '',
              ),
              style: email.EmailValidator.validate(emailController.text)
                  ? blueTextStyle
                  : redTextStyle,
            ),
          ],
        ),
      );
    }

    Widget inputPassword() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: passwordController,
              cursorColor: primaryColor,
              obscureText: obscureText,
              onChanged: (value) {
                setState(() {});
              },
              validator: MinLengthValidator(8, errorText: ''),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    (obscureText == true)
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: toggle,
                ),
                contentPadding: EdgeInsets.only(left: 28, bottom: 20, top: 20),
                fillColor: Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: '',
              ),
              style: blueTextStyle,
            ),
          ],
        ),
      );
    }

    Widget inputGoal() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Goal',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: goalController,
              cursorColor: primaryColor,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 28, bottom: 20, top: 20),
                fillColor: Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: '',
              ),
              style: blueTextStyle,
            ),
          ],
        ),
      );
    }

    Widget signUpButton() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        height: 45,
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
                      showError('Email sudah terdaftar');
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
                    borderRadius: BorderRadius.circular(10),
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
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign-in');
            },
            child: Text(
              'I Already Have An Account',
              style: greyTextStyle.copyWith(
                fontWeight: light,
              ),
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
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
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
    );
  }
}

// Note: {"id":"aZnoallj878usu3Fkqfn","name":"Adam Abdurrahman","email":"adam@adam.com","password":"1234567890","goal":"Menjadi orang yang merdeka"}
