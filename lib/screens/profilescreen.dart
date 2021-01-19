import 'package:flutter/material.dart';
import 'package:toadstool/widgets/mybutton.dart';
import 'package:toadstool/widgets/mytextformfield.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).canvasColor,
        actions: [],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 155,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    maxRadius: 65.0,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/564x/a8/0e/0c/a80e0c79ac140aafb017b7f4d665abb8.jpg'),
                  ),
                  SizedBox(
                    height: 25.0,
                  )
                ],
              ),
            ),
            Container(
              height: 350,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyTextFormField(
                    name: 'Surpiya Malla',
                    icon: Icons.person_outline,
                  ),
                  MyTextFormField(
                    name: 'supriya.malla02@gmai.com',
                    icon: Icons.mail_outline,
                  ),
                  MyTextFormField(
                    name: '9841476839',
                    icon: Icons.phone_outlined,
                  ),
                  MyTextFormField(name: 'Gender', icon: Icons.people_outline),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 45.0,
              width: 200.0,
              child: MyButton(
                name: 'Edit Profile',
              ),
            )
          ],
        ),
      ),
    );
  }
}
