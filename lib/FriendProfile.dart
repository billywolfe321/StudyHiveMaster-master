import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FriendProfile extends StatefulWidget {
  final String friendId;

  FriendProfile({required this.friendId});

  @override
  _FriendProfileState createState() => _FriendProfileState();
}

class _FriendProfileState extends State<FriendProfile> {
  final databaseReference = FirebaseDatabase.instance.ref();

  String firstName = '';
  String lastName = '';
  String username = '';
  String bio = '';
  String university = '';
  String course = '';
  int friendCount = 0;

  @override
  void initState() {
    super.initState();
    fetchFriendData();
  }

  Future<void> fetchFriendData() async {
    final friendSnapshot = await databaseReference.child('Users/${widget.friendId}').get();
    if (friendSnapshot.exists) {
      final friendData = friendSnapshot.value as Map<dynamic, dynamic>;
      setState(() {
        firstName = friendData['firstName'] ?? '';
        lastName = friendData['lastName'] ?? '';
        username = friendData['username'] ?? '';
        bio = friendData['bio'] ?? '';
        university = friendData['university'] ?? '';
        course = friendData['course'] ?? '';
        friendCount = friendData['friends'] != null ? (friendData['friends'] as Map).length : 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$firstName $lastName's Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(radius: 60, backgroundImage: AssetImage("assets/profilePicture1.png")), // Placeholder image
            SizedBox(height: 10),
            Text("$firstName $lastName", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(username, style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileInfoBox(title: course, subtitle: "Subject"),
                ProfileInfoBox(title: "$friendCount Friends", subtitle: ""),
                ProfileInfoBox(title: university, subtitle: "University"),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bio", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 10),
                  Text(bio),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "Forums"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "Profile"),
        ],
        onTap: (int index) {
          // Handle bottom navigation item taps
        },
        backgroundColor: Color(0xffae32ff),
        selectedItemColor: Color(0xffffffff),
        unselectedItemColor: Color(0xffffffff),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class ProfileInfoBox extends StatelessWidget {
  final String title;
  final String subtitle;

  ProfileInfoBox({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
