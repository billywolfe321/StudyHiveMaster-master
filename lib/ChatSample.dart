import 'package:flutter/material.dart';

enum MessageType { receive, send }

class UpperNipMessageClipper extends CustomClipper<Path> {
  final MessageType type;

  UpperNipMessageClipper(this.type);

  @override
  Path getClip(Size size) {
    Path path = Path();
    if (type == MessageType.receive) {
      path.moveTo(20, 0);
      path.lineTo(size.width - 20, 0);
      path.quadraticBezierTo(
          size.width, 0, size.width, 20);
      path.lineTo(size.width, size.height - 20);
      path.quadraticBezierTo(
          size.width, size.height, size.width - 20, size.height);
      path.lineTo(10, size.height);
      path.quadraticBezierTo(0, size.height, 0, size.height - 20);
      path.lineTo(0, 20);
      path.quadraticBezierTo(0, 0, 20, 0);
    } else {
      path.moveTo(20, 0);
      path.lineTo(size.width - 20, 0);
      path.quadraticBezierTo(
          size.width, 0, size.width, 20);
      path.lineTo(size.width, size.height - 20);
      path.quadraticBezierTo(
          size.width, size.height, size.width - 20, size.height);
      path.lineTo(20, size.height);
      path.quadraticBezierTo(0, size.height, 0, size.height - 20);
      path.lineTo(0, 20);
      path.quadraticBezierTo(0, 0, 20, 0);
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ChatSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 80),
          child: ClipPath(
            clipper: UpperNipMessageClipper(MessageType.receive),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFE1E1E2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              child: Text(
                "Hello, How are you?",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}