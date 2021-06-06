part of 'pages.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    MyHomePage(),
    MyHomePage(),
    MyHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    Widget bottomNavigationBar() {
      return BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14.0,
              backgroundImage: NetworkImage(
                universalUrl + userProvider.user.picturePath,
              ),
            ),
            label: userProvider.user.name,
          ),
        ],
      );
    }

    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
