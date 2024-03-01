import 'package:flutter/material.dart';
import 'index.dart';

class OpenForum extends StatefulWidget {
  @override
  _OpenForumState createState() => _OpenForumState();
}

class _OpenForumState extends State<OpenForum> {
  TextEditingController replyController = TextEditingController();
  bool showReplyBox = false;

  void _showReplyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Reply to the Discussion"),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          ),
          content: TextField(
            controller: replyController,
            maxLines: null, // Allows for multiple lines
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your comment...',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Handle submit button press
                String comment = replyController.text;
                // TODO: Implement logic to post the comment to the forum
                print("Submitted Comment: $comment");
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Submit"),
            ),
          ],
        );
      },
    );
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
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                "Forum Title",
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment(-0.8, 0.0),
                child: Text(
                  "Forum Author",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.all(10),
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0x1f000000),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.zero,
                border: Border.all(color: Color(0x4d9e9e9e), width: 1),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Discussion ",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: () {
                    // Handle thumbs up
                  },
                  icon: Icon(Icons.thumb_up),
                ),
                IconButton(
                  onPressed: () {
                    // Handle thumbs down
                  },
                  icon: Icon(Icons.thumb_down),
                ),
                IconButton(
                  onPressed: () {
                    // Handle thumbs down
                  },
                  icon: Icon(Icons.report),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      showReplyBox = !showReplyBox;
                    });
                  },
                  color: Color(0xff04ff39),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Color(0xff808080), width: 1),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Reply",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  textColor: Color(0xff000000),
                  height: 40,
                  minWidth: 100,
                ),
              ],
            ),
            if (showReplyBox)
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Reply Text Box
                    TextField(
                      controller: replyController,
                      maxLines: null, // Allows for multiple lines
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Reply to the discussion',
                      ),
                    ),

                    // Submit Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Handle submit button press
                            String comment = replyController.text;
                            // logic to post the comment to the forum goes here
                            print("Submitted Comment: $comment");
                            setState(() {
                              showReplyBox = false; // Hide the reply box
                            });
                          },
                          child: Text("Submit"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment(-0.8, 0.0),
                child: Text(
                  "Comments",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                shrinkWrap: false,
                physics: ScrollPhysics(),
                children: [
                  ListTile(
                    tileColor: Color(0x1f000000),
                    title: Text(
                      "User1214",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    subtitle: Text(
                      "Comments about the discussion",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    dense: false,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    selected: false,
                    selectedTileColor: Color(0x42000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    leading: Icon(Icons.thumb_up, color: Color(0xff212435), size: 24),
                  ),
                  ListTile(
                    tileColor: Color(0x1f000000),
                    title: Text(
                      "User3847",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    subtitle: Text(
                      "Comments about the discussion",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    dense: false,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    selected: false,
                    selectedTileColor: Color(0x42000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    leading: Icon(Icons.thumb_up, color: Color(0xff212435), size: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}