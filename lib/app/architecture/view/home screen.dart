import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:triptrails/app/architecture/view/dashboard.dart';
import 'package:triptrails/app/architecture/view/packages.dart';
import 'package:triptrails/app/theme/app_colors.dart';
import 'package:triptrails/app/widgets/cover widget.dart';
import 'package:triptrails/app/architecture/view/upload package screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _pageIndex = 0;
  PageController _pageController = PageController();

  final List<String> titles = [
    'Dashboard',
    'Places',
    'Upload Packages',
    'Featured Packages',
    'Package',
    'locations',
    'Notifications',
    'Users',
    'Admin',
    'Settings'
  ];

  final List icons = [
    LineIcons.pieChart,
    LineIcons.mapMarker,
    LineIcons.boxOpen,
    LineIcons.arrowCircleUp,
    LineIcons.rocket,
    LineIcons.mapPin,
    LineIcons.bell,
    LineIcons.users,
    LineIcons.user,
    LineIcons.screwdriver,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //app bar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lavender,
                    fontFamily: 'Muli',
                  ),
                  text: 'Trip Trails',
                  children: <TextSpan>[
                    TextSpan(
                      text: ' - Admin Panel',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800],
                        fontFamily: 'Muli',
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                    color: Color(0xFF667BC6),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(2, 2))
                    ]),
                child: TextButton.icon(
                  style: ButtonStyle(
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  icon: Icon(
                    LineIcons.alternateSignOut,
                    color: Colors.white,
                    size: 20,
                  ),
                  label: Text(
                    'Logout',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF667BC6)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton.icon(
                  style: ButtonStyle(
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  icon: Icon(
                    LineIcons.user,
                    color: Color(0xFF667BC6),
                    size: 20,
                  ),
                  label: Text(
                    'Signed in as admin ',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF667BC6),
                        fontSize: 16),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      ),

      //body
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Container(
              width: 230,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageIndex = index;
                        _pageController.jumpToPage(_pageIndex);
                      });
                    },
                    child: Container(
                      color: _pageIndex == index
                          ? Color(0xFF667BC6).withOpacity(0.5)
                          : Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Row(
                        children: <Widget>[
                           Icon(
                            icons[index],
                            color: Colors.grey[800],
                          ),
                          SizedBox(width: 10),
                          Text(
                            titles[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                children: <Widget>[
                  DataInfoPage(),
                      CoverWidget(widget: PlacesPage()),
                      CoverWidget(widget: UploadPackageForm()),
                  Center(child: Text('Upload Place')),
                  Center(child: Text('Blogs')),
                  Center(child: Text('Upload Blog')),
                  Center(child: Text('States')),
                  Center(child: Text('Notifications')),
                  Center(child: Text('Users')),
                  Center(child: Text('Admin')),
                  Center(child: Text('Settings')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
