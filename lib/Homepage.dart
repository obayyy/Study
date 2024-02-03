import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'UNIVERSITY.dart';
import 'Modules.dart';
import 'Saved.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

int bindex = 0;
List<Widget> pages = <Widget>[];

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    pages.add(const UNIVERSITY());
    pages.add(const Modules());
    pages.add(const Saved());
    super.initState();
  }

  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: GNav(
          selectedIndex: bindex,
          onTabChange: (index) {
            setState(() {
              bindex = index;
            });
          },
          rippleColor: const Color.fromARGB(
              255, 66, 66, 66), // tab button ripple color when pressed
          hoverColor:
              const Color.fromARGB(255, 97, 97, 97), // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 30,
          tabActiveBorder:
              Border.all(color: Colors.black, width: 1), // tab button border
          tabBorder:
              Border.all(color: Colors.grey, width: 1), // tab button border
          tabShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
          ], // tab button shadow
          curve: Curves.easeOutExpo, // tab animation curves
          duration: Duration(milliseconds: 800), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor:
              Color.fromARGB(255, 99, 154, 218), // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor: Color.fromARGB(255, 79, 165, 223)
              .withOpacity(0.1), // selected tab background color
          padding: EdgeInsets.symmetric(
              horizontal: 20, vertical: 10), // navigation bar padding
          tabs: [
            GButton(
              icon: Icons.school,
              text: 'UNIVERSITY',
            ),
            GButton(
              icon: Icons.book,
              text: 'Modules',
            ),
            GButton(
              icon: Icons.favorite_sharp,
              text: 'Saved',
            ),
          ]),
      body: pages[bindex],
    );
    return scaffold;
  }
}
