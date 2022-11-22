import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/custom_widgets/customText.dart';
import 'package:flutter_project/services/ads.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import '../model/ads.dart';
import '../custom_widgets/appImagePicker.dart';
import '../custom_widgets/customButton.dart';
import '../custom_widgets/textFormField.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import 'package:http/http.dart' as http;

class CreateAdScreen extends StatefulWidget {
  const CreateAdScreen({super.key});

  @override
  State<CreateAdScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CreateAdScreen> {
  TextEditingController _titleCtrl = TextEditingController();
  TextEditingController _priceCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();
  TextEditingController _descriptionCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> _errorPics = [
    Constants.defaultImage,
  ];
  List<dynamic> _imagePath = [];
  List<String> _imageServerPath = [];
  bool _isLoading = false;
  void captureImageFromGallery() async {
    var files = await ImagePicker().pickMultiImage();
    if (files.isNotEmpty) {
      _uploadMultitpleFiles(files);
    }
  }

  _uploadMultitpleFiles(List<XFile> files) async {
    var url = Uri.parse("${Constants().serverUrl}/upload/photos");
    var request = http.MultipartRequest('POST', url);
    files.forEach((file) async {
      MultipartFile images =
          await http.MultipartFile.fromPath('photos', file.path);
      request.files.add(images);
    });
    var response = await request.send();
    var resp = await response.stream.bytesToString();
    //print(resp);
    var respJson = jsonDecode(resp);
    setState(() {
      _imagePath = respJson['data']['path'];
      _imageServerPath = _imagePath.map((str) => str.toString()).toList();
      //print(_imageServerPath);
    });
  }

  void creatAd() async {
    var ad = Ad(
        title: _titleCtrl.text,
        mobile: _mobileCtrl.text,
        price: num.parse(_priceCtrl.text),
        description: _descriptionCtrl.text,
        images: _imageServerPath.isNotEmpty ? _imageServerPath : _errorPics);
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      AdService().createPost(context, ad);
      _isLoading = false;
    });
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.createAd),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [BoxShadow(color: Colors.blueAccent)]),
                  padding: EdgeInsets.all(24.0),
                  child: AppImagePicker()),
              const SizedBox(
                height: 15,
              ),
              CustomTextForm().generalTextField(_titleCtrl, 'title'),
              const SizedBox(
                height: 15,
              ),
              CustomTextForm().generalTextField(_priceCtrl, 'price'),
              const SizedBox(
                height: 15,
              ),
              CustomTextForm().generalTextField(_mobileCtrl, 'mobile'),
              const SizedBox(
                height: 15,
              ),
              CustomTextForm()
                  .generalTextField(_descriptionCtrl, 'description'),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: CustomButton().customOrangeButton(),
                    child: CustomText().customOrangeText(Strings.submitAd)),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )));
  }
}
