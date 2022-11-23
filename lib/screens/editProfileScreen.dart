import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../custom_widgets/textFormField.dart';
import '../model/user.dart';
import '../services/profile.dart';
import '../utils/alert_manager.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class EditProfileScreen extends StatefulWidget {
  dynamic data;
  EditProfileScreen({super.key, required this.data});

  @override
  State<EditProfileScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditProfileScreen> {
  TextEditingController _nameCtrl =
      TextEditingController(text: Strings.profileFullName);
  TextEditingController _emailCtrl =
      TextEditingController(text: Strings.profileEmail);
  TextEditingController _mobileCtrl =
      TextEditingController(text: Strings.profileFullPhone);
  String _imagePath = '';
  String _imageServerPath = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.editProfile),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: ProfileService().myUserPost(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                Map userData = snapshot.data!;
                return SingleChildScrollView(
                  child: Center(
                      child: Container(
                    padding: EdgeInsets.only(left: 20),
                    width: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: const Color(0xfff25723),
                                context: context,
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              captureImageFromGallery();
                                            },
                                            child:
                                                Text(Strings.captureGallery)),
                                        TextButton(
                                            onPressed: () {
                                              captureImageFromCamera();
                                            },
                                            child: Text(Strings.captureCamera))
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 75,
                            child: _imagePath.isNotEmpty
                                ? CircleAvatar(
                                    radius: 48,
                                    backgroundImage: FileImage(
                                      File(_imagePath),
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 48,
                                    backgroundImage: NetworkImage(
                                      userData['imgURL'],
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextForm().generalTextField(_nameCtrl, 'name'),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextForm().generalTextField(_emailCtrl, 'email'),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextForm().generalTextField(_mobileCtrl, 'phone'),
                        const SizedBox(
                          height: 35,
                        ),
                        SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              updateUser();
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.only(
                                      top: 15,
                                      bottom: 15,
                                      right: 25,
                                      left: 25)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xffF25723)),
                            ),
                            child: const Text(
                              Strings.updateProfile,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "/login");
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.only(
                                      top: 15,
                                      bottom: 15,
                                      right: 25,
                                      left: 25)),
                            ),
                            child: const Text(
                              Strings.logout,
                              style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffF25723)),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
                );
              }
              if (snapshot.hasError) {
                //print(snapshot.hasError);
                return AlertManager().displaySnackbar(context, "Error");
              }
              return CircularProgressIndicator();
            })));
  }

  _upload(filePath) async {
    var url = Uri.parse("${Constants().serverUrl}/upload/profile");
    var request = http.MultipartRequest('POST', url);
    MultipartFile image = await http.MultipartFile.fromPath('avatar', filePath);
    request.files.add(image);
    var response = await request.send();
    var resp = await response.stream.bytesToString();
    //print(resp);
    var respJson = jsonDecode(resp);
    setState(() {
      _imageServerPath = respJson['data']['path'];
      //print(_imageServerPath);
    });
  }

  void captureImageFromGallery() async {
    var file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      //print(file.path);
      setState(() {
        _imagePath = file.path;
      });
      _upload(file.path);
    }
  }

  void captureImageFromCamera() async {
    var file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file != null) {
      //print(file.path);
      setState(() {
        _imagePath = file.path;
        //print(_imageServerPath);
      });
      _upload(file.path);
    }
  }

  void updateUser() async {
    var userData = User(
        name: _nameCtrl.text,
        email: _emailCtrl.text,
        mobile: _mobileCtrl.text,
        imgURL: _imageServerPath.isNotEmpty
            ? _imageServerPath
            : '${widget.data['imgURL']}');
    ProfileService().myUserPatch(context, userData);
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _isLoading = false;
    });
  }
}
