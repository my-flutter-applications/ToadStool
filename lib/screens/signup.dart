import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toadstool/widgets/changescreen.dart';
import 'package:toadstool/widgets/mytextformfield.dart';
import 'package:toadstool/widgets/passwordtextformfield.dart';
// import 'package:form_field_validator/form_field_validator.dart';
import 'login.dart';
import '../widgets/mybutton.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
// String username;
String email;
String password;
// String address;

class _SignUpState extends State<SignUp> {
  void validation() async {
    final FormState _form = _formKey.currentState;

    if (!_form.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
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
    } else {}
  }

  Widget _buildAllTextFormField() {
    return Wrap(
      runSpacing: 20,
      children: [
        MyTextFormField(
          name: 'Username',
          validator: (value) {
            if (value == '') {
              return 'Please Fill Your Username';
            } else if (value.length < 6) {
              return 'Username Is Too Short';
            }

            return '';
          },
        ),
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
        ),
        PasswordTextFormField(
          obserText: obserText,
          name: 'Password',
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
            setState(() {
              obserText = !obserText;
            });
            FocusScope.of(context).unfocus();
          },
        ),
        MyTextFormField(
          name: 'Address',
          validator: (value) {
            if (value == '') {
              return 'Please fill in your address';
            }
          },
        )
      ],
    );
  }

  Widget _buildBottomPart() {
    return Column(
      children: [
        Container(
            height: 40.0,
            width: double.infinity,
            child: MyButton(
              name: 'Sign Up',
              onPressed: () => validation(),
            )),
        SizedBox(
          height: 10.0,
        ),
        ChangeScreen(
          name: 'Log In',
          whichAccount: 'I already have an account',
          onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: SafeArea(
            child: Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 50, 10, 50),
                    // height: 80,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign up',
                          style: TextStyle(
                              fontSize: 38.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Get your gardening game on!',
                          style: TextStyle(fontSize: 20.0),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 30.0,
                  // ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        // color: Colors.blue,
                        // height: 400.0,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Wrap(
                          runSpacing: 20,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildAllTextFormField(),
                            _buildBottomPart(),
                            /////
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
