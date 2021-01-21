import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:firebase_storage/firebase_storage.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File _pickedImage;
  PickedFile _image;
  Future<void> getImage({ImageSource source}) async {
    _image = await ImagePicker().getImage(source: source);
    if (_image != null) {
      setState(() {
        _pickedImage = File(_image.path);
      });
    }
  }

  String imageUrl;

  void _uploadImage({File image}) async {
    User user = FirebaseAuth.instance.currentUser;
    Reference storageReference =
        FirebaseStorage.instance.ref().child('UserImage/${user.uid}');
    UploadTask uploadTask = storageReference.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    imageUrl = await snapshot.ref.getDownloadURL();
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

  Future<void> myDialogBox() {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera),
                    title: Text('Pick From Camera'),
                    onTap: () {
                      getImage(source: ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Pick From Gallery'),
                    onTap: () {
                      getImage(source: ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
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
                    _uploadImage(image: _pickedImage);
                    setState(() {
                      edit = false;
                    });
                    // Navigator.pop(context);
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
                            backgroundColor: Colors.white,
                            maxRadius: 65.0,
                            backgroundImage: _pickedImage == null
                                ? AssetImage('images/user-def.png')
                                : FileImage(_pickedImage),
                          ),
                          SizedBox(
                            height: 15.0,
                          )
                        ],
                      ),
                    ),
                    edit == true
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 220.0, top: 85.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: GestureDetector(
                                onTap: () {
                                  myDialogBox();
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).accentColor,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Theme.of(context).canvasColor,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                edit == false
                    ? _buildTextFormFieldPart()
                    : _buildContainerPart(),
                SizedBox(
                  height: 20.0,
                ),
                edit == false
                    ? Container(
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
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
