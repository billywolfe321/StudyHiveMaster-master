import 'package:flutter/material.dart';
import 'index.dart';
import 'Forums.dart';
import 'ChatPage.dart';
import 'UserProfile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "Forums"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "Profile"),
        ],
        backgroundColor: Color(0xffae32ff),
        elevation: 8,
        iconSize: 22,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          if (value == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Forums()));
          } else if (value == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ChatPage()));
          } else if (value == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => UserProfile()));
          }
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(2),
        child: Column(
          children: [
            sectionTitle("Top Forums For You"),
            sectionListTile("Software Engineering", "Computer Science"),
            sectionListTile("BIDMAS", "Maths"),
            sectionListTile("Bones", "Science"),
            sectionTitle("Your Friends Most Recent Posts"),
            sectionListTile("Big Data", "Computer Science"),
            sectionListTile("UI Design", "Computer Science"),
            sectionListTile("Databases", "Computer Science"),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget sectionListTile(String title, String subtitle) {
    return ListTile(
      tileColor: Color(0x1f000000),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      dense: false,
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      leading: Icon(Icons.article, color: Color(0xff212435), size: 24),
      trailing: Icon(Icons.arrow_forward, color: Color(0xff212435), size: 24),
    );
  }
}
