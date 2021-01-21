import 'package:flutter/material.dart';
import 'package:toadstool/widgets/mybutton.dart';
import 'package:toadstool/widgets/mytextformfield.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).canvasColor,
        leading: edit == true
            ? IconButton(
                icon: Icon(
                  Icons.close,
                  size: 30.0,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {
                  setState(() {
                    edit = false;
                  });
                })
            : IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
        actions: [
          edit == true
              ? IconButton(
                  icon: Icon(
                    Icons.check,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
              : Icon(null)
        ],
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Container(
            height: 600,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
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
                            height: 15.0,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 220.0, top: 85.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).accentColor,
                          child: Icon(
                            Icons.edit,
                            color: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                edit == false
                    ? Container(
                        height: 350,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyTextFormField(
                              enableEdit: false,
                              name: 'Supriya Malla',
                              icon: Icons.person_outline,
                            ),
                            MyTextFormField(
                              enableEdit: false,
                              name: 'supriya.malla02@gmai.com',
                              icon: Icons.mail_outline,
                            ),
                            MyTextFormField(
                              enableEdit: false,
                              name: '9841476839',
                              icon: Icons.phone_outlined,
                            ),
                            MyTextFormField(
                                enableEdit: false,
                                name: 'Fusha Village',
                                icon: Icons.people_outline),
                          ],
                        ),
                      )
                    : Container(
                        height: 350,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyTextFormField(
                              enableEdit: true,
                              name: 'Surpiya Malla',
                              icon: Icons.person_outline,
                            ),
                            MyTextFormField(
                              enableEdit: true,
                              name: 'supriya.malla02@gmai.com',
                              icon: Icons.mail_outline,
                            ),
                            MyTextFormField(
                              enableEdit: true,
                              name: '9841476839',
                              icon: Icons.phone_outlined,
                            ),
                            MyTextFormField(
                                enableEdit: true,
                                name: 'Gender',
                                icon: Icons.people_outline),
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
                    onPressed: () {
                      setState(() {
                        edit = true;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
