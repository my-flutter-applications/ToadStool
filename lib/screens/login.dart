import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toadstool/widgets/changescreen.dart';
import 'package:toadstool/widgets/mybutton.dart';
import 'package:toadstool/widgets/mytextformfield.dart';
import 'package:toadstool/widgets/passwordtextformfield.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
String email;
String password;

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

void validation() async {
  final FormState _form = _formKey.currentState;
  if (!_form.validate()) {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(result.user.uid);
    } catch (e) {
      print(e.message.toString());

      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            e.message,
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  } else {
    print('no');
  }
}

class _LoginState extends State<Login> {
  Widget _buildAllPart() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 50, 10, 20),
            height: 100,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back',
                  style: TextStyle(
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'Sign in to your account',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                )
              ],
            ),
          ),
          // SizedBox(
          //   height: 15.0,
          // ),
          Form(
            key: _formKey,
            child: Container(
              // color: Colors.blue,
              height: 400.0,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyTextFormField(
                    name: 'Email',
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator: (value) {
                      if (value == '') {
                        return 'Please Fill Your Email';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Email is invalid';
                      }
                      return '';
                    },
                    icon: Icons.mail,
                  ),
                  PasswordTextFormField(
                    obserText: obserText,
                    name: 'Password',
                    icon: Icons.lock,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    validator: (value) {
                      if (value == '') {
                        return 'Please Fill In Your Password';
                      } else if (value.length < 8) {
                        return 'Password Is Too Short';
                      }
                      return '';
                    },
                    onTap: () {
                      FocusScope.of(context).unfocus();

                      setState(() {
                        obserText = !obserText;
                      });
                    },
                  ),
                  Container(
                    height: 40.0,
                    width: double.infinity,
                    child: MyButton(
                      name: 'Log In',
                      onPressed: () => validation(),
                    ),
                  ),
                  ChangeScreen(
                    name: 'Sign Up',
                    whichAccount: "I don't have an account!",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: SafeArea(
            child: _buildAllPart(),
          ),
        ),
      ),
    );
  }
}
