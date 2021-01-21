import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toadstool/model/usermodel.dart';
import 'package:toadstool/provider/plant_provider.dart';
import 'package:toadstool/screens/basketscreen.dart';
import 'package:toadstool/screens/homepage.dart';
import 'package:toadstool/widgets/mybutton.dart';
import 'package:toadstool/widgets/mytextformfield.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File _pickedImage;
  PickedFile _image;
  Future<void> getImage() async {
    _image = await ImagePicker().getImage(source: ImageSource.camera);
    _pickedImage = File(_image.path);
  }

  PlantProvider plantProvider;
  bool edit = false;

  Widget _buildContainerPart() {
    List<UserModel> userModel = plantProvider.userModelList;

    return Column(
      children: userModel.map((e) {
        return Container(
          height: 350,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyTextFormField(
                enableEdit: true,
                name: e.userName,
                icon: Icons.person_outline,
              ),
              MyTextFormField(
                enableEdit: true,
                name: e.userEmail,
                icon: Icons.mail_outline,
              ),
              MyTextFormField(
                enableEdit: true,
                name: e.userPhoneNumber,
                icon: Icons.phone_outlined,
              ),
              MyTextFormField(
                  enableEdit: true,
                  name: e.userAddress,
                  icon: Icons.people_outline),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTextFormFieldPart() {
    List<UserModel> userModel = plantProvider.userModelList;

    return Column(
      children: userModel.map((e) {
        return Container(
          height: 350,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyTextFormField(
                enableEdit: false,
                name: e.userName,
                icon: Icons.person_outline,
              ),
              MyTextFormField(
                enableEdit: false,
                name: e.userEmail,
                icon: Icons.mail_outline,
              ),
              MyTextFormField(
                enableEdit: false,
                name: e.userPhoneNumber,
                icon: Icons.phone_outlined,
              ),
              MyTextFormField(
                  enableEdit: false,
                  name: e.userAddress,
                  icon: Icons.people_outline),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    plantProvider = Provider.of(context);
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
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
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
                        child: GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).accentColor,
                            child: Icon(
                              Icons.camera_alt,
                              color: Theme.of(context).canvasColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                edit == false
                    ? _buildTextFormFieldPart()
                    : _buildContainerPart(),
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
