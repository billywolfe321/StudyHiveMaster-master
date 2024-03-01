import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool pushNotification = true;
  bool chatNotification = true;
  bool emailNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffae32ff),
        elevation: 0,
        title: Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildNotificationSetting(
              "Push Notification",
              pushNotification,
                  (value) => setState(() => pushNotification = value),
            ),
            buildNotificationSetting(
              "Chat Notification",
              chatNotification,
                  (value) => setState(() => chatNotification = value),
            ),
            buildNotificationSetting(
              "Email Notification",
              emailNotification,
                  (value) => setState(() => emailNotification = value),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationSetting(String title, bool value, ValueChanged<bool> onChanged) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListTile(
          title: Text(title, style: TextStyle(fontSize: 16)),
          subtitle: Text("Receive $title", style: TextStyle(fontSize: 12)),
          trailing: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Color(0xff3a57e8),
          ),
        ),
      ),
    );
  }
}