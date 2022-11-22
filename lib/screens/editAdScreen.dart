import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../custom_widgets/appImagePicker.dart';
import '../custom_widgets/circularProgressIndicator.dart';
import '../custom_widgets/imageSelect.dart';
import 'package:image_picker/image_picker.dart';
import '../custom_widgets/textFormField.dart';
import '../model/ads.dart';
import '../services/ads.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';

class EditAdScreen extends StatefulWidget {
  dynamic product;
  EditAdScreen({super.key, required this.product});

  @override
  State<EditAdScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditAdScreen> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _priceCtrl = TextEditingController();
  final TextEditingController _mobileCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();
  bool _isLoading = false;
  String _imagePath = "[]";
  String _imageServerPath = "[]";

  _upload(filePath) async {
    var url = Uri.parse("https://adlisting.herokuapp.com/upload/profile");
    var request = http.MultipartRequest('POST', url);
    http.MultipartFile image =
        await http.MultipartFile.fromPath('avatar', filePath);
    request.files.add(image);
    var response = await request.send();
    var resp = await response.stream.bytesToString();
    var respJson = jsonDecode(resp);
    setState(() {
      _imageServerPath = respJson['data']['path'];
    });
  }

  void captureImageFromGallery() async {
    var file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _imagePath = file.path;
      });
      _upload(file.path);
    }
  }

  void updateAd() async {
    var ad = Ad(
        sId: widget.product['id'],
        authorName: widget.product['authorName'],
        title: _titleCtrl.text,
        mobile: _mobileCtrl.text,
        price: num.parse(_priceCtrl.text),
        description: _descriptionCtrl.text,
        images: _imageServerPath.isNotEmpty
            ? _imageServerPath
            : widget.product['images']);
    //print(ad.toJson());
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      AdService().patchPost(ad, context);
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
          title: Text(Strings.editAd),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
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
              SizedBox(
                width: 400,
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.product["product"]["images"].length,
                  itemBuilder: ((context, index) {
                    return ImageSelect(
                      img: widget.product["product"]["images"][index],
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextForm().generalTextFieldFilled(
                  _titleCtrl, widget.product["product"]["title"], 'title'),
              const SizedBox(
                height: 15,
              ),
              CustomTextForm().generalTextFieldFilled(_priceCtrl,
                  widget.product["product"]["price"].toString(), 'price'),
              const SizedBox(
                height: 15,
              ),
              CustomTextForm().generalTextFieldFilled(
                  _mobileCtrl, widget.product["product"]["mobile"], 'mobile'),
              const SizedBox(
                height: 15,
              ),
              CustomTextForm().generalTextFieldFilled(_descriptionCtrl,
                  widget.product["product"]["description"], 'description'),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    updateAd();
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.only(
                            top: 15, bottom: 15, right: 25, left: 25)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffF25723)),
                  ),
                  child: CustomCircularProgress()
                      .customCPIContainerText(_isLoading, Strings.submitAd),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )));
  }
}
