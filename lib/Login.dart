import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'Registration1.dart';
import 'HomeScreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  final _emailOrUsernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _passwordVisible = false;

  void _signIn() async {
    final input = _emailOrUsernameController.text.trim();
    String email = '';
    if (input.contains('@')) {
      email = input;
    } else {
      final usernameSnapshot = await FirebaseDatabase.instance.ref().child('Usernames/$input').get();
      if (usernameSnapshot.exists) {
        final userId = usernameSnapshot.value as String?;
        if (userId != null) {
          final emailSnapshot = await FirebaseDatabase.instance.ref().child('Users/$userId/email').get();
          if (emailSnapshot.exists && emailSnapshot.value != null) {
            email = emailSnapshot.value as String;
          } else {
            setState(() {
              _errorMessage = 'Email not found for username.';
            });
            return;
          }
        } else {
          setState(() {
            _errorMessage = 'Username not found.';
          });
          return;
        }
      } else {
        setState(() {
          _errorMessage = 'Username not found.';
        });
        return;
      }
    }
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: _passwordController.text,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message ?? 'An unknown error occurred.';
      });
    }
  }

  void _resetPassword() async {
    final email = _emailOrUsernameController.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      setState(() {
        _errorMessage = 'Please enter a valid email address for password reset.';
      });
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      setState(() {
        _errorMessage = 'Password reset link sent to $email';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message ?? 'An unknown error occurred';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3f93f2),
        title: Text(
          "Login Page",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Color(0xffffffff),
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xffffffff),
          size: 24,
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextField(
                controller: _emailOrUsernameController,
                decoration: InputDecoration(
                  labelText: "Enter Email or Username",
                  fillColor: Color(0xfff2f2f3),
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  labelText: "Enter Password",
                  fillColor: Color(0xfff2f2f3),
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _resetPassword,
                  child: Text('Forgot Password?'),
                ),
              ),
              SizedBox(height: 20),
              MaterialButton(
                onPressed: _signIn,
                color: Color(0xfffed140),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 14),
                ),
                textColor: Color(0xff000000),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Registration1()),
                  );
                },
                color: Color(0xfffed141),
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 14),
                ),
                textColor: Color(0xff000000),
              ),
              SizedBox(height: 16.0),
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
