import 'package:cloud_firestore/cloud_firestore.dart';
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
String password, userName, address, phoneNumber;
// String address;

class _SignUpState extends State<SignUp> {
  void validation() async {
    final FormState _form = _formKey.currentState;

    if (!_form.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        FirebaseFirestore.instance.collection('User').doc(result.user.uid).set({
          'Username': userName,
          'UserId': result.user.uid,
          'UserEmail': email,
          'Address': address,
          'PhoneNumber': phoneNumber,
        });
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
          onChanged: (value) {
            setState(() {
              userName = value;
            });
          },
          icon: Icons.person,
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
          icon: Icons.mail,
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
            setState(() {
              obserText = !obserText;
            });
            FocusScope.of(context).unfocus();
          },
        ),
        MyTextFormField(
          name: 'Address',
          onChanged: (value) {
            setState(() {
              address = value;
            });
          },
          icon: Icons.location_city,
          validator: (value) {
            if (value == '') {
              return 'Please fill in your address';
            }
          },
        ),
        MyTextFormField(
          name: 'Phone No.',
          onChanged: (value) {
            setState(() {
              phoneNumber = value;
            });
          },
          icon: Icons.phone,
          validator: (value) {
            if (value == '') {
              return 'Please fill in your phone number';
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
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: ChangeScreen(
            name: 'Log In',
            whichAccount: 'I already have an account',
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              ),
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
                    margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
                    // height: 80,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Get your gardening game on!',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
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
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight: MediaQuery.of(context).size.height),
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
