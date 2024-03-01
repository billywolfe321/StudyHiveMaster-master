import 'package:flutter/material.dart';
import 'index.dart';

class Forums extends StatefulWidget {
  @override
  _ForumsState createState() => _ForumsState();
}

class _ForumsState extends State<Forums> {
  List<Map<String, dynamic>> forumList = [
    {
      "title": "Software Engineering",
      "subtitle": "Computer Science",
    },
    {
      "title": "BIDMAS",
      "subtitle": "Maths",
    },
    {
      "title": "Bones",
      "subtitle": "Science",
    },
    {
      "title": "Functional Programming",
      "subtitle": "Computer Science",
    },
  ];

  List<Map<String, dynamic>> filteredList = [];

  String dropdownValue = 'My Forums';

  @override
  void initState() {
    super.initState();
    filteredList.addAll(forumList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffad32fe),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: Row(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 28,
              ),
              SizedBox(width: 28),
              Text(
                "Study Hive",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  color: Color(0xffffffff),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "Forums",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Profile",
          ),
        ],
        onTap: (int index) {
          // Handle bottom navigation item taps
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Forums()),
            );
          } else if (index == 1) {
            // Handle Messages navigation
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserProfile()),
            );
          }
        },
        backgroundColor: Color(0xffae32ff),
        elevation: 8,
        iconSize: 22,
        selectedItemColor: Color(0xffffffff),
        unselectedItemColor: Color(0xffffffff),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                filterForums(value);
              },
              decoration: InputDecoration(
                hintText: 'Search forums...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 8), // Add spacing between search bar and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement filter button functionality here
                  },
                  child: Text(
                    'Filter',
                    style: TextStyle(fontSize: 12),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (String result) {
                    setState(() {
                      dropdownValue = result;
                    });
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'My Forums',
                      child: Text('My Forums'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Most Recent',
                      child: Text('Most Recent'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Friends',
                      child: Text('Friends'),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to AddForum page when button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddForum()),
                    );
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add New Forum'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredList[index]["title"]),
                    subtitle: Text(filteredList[index]["subtitle"]),
                    leading: Icon(
                      Icons.article,
                      color: Color(0xff212435),
                      size: 24,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward,
                      color: Color(0xff212435),
                      size: 24,
                    ),
                    onTap: () {
                      // Handle forum item tap
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterForums(String query) {
    setState(() {
      filteredList = forumList
          .where((forum) =>
          forum["title"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}