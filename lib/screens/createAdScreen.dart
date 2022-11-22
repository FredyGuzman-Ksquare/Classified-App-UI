import 'package:flutter/material.dart';
import 'package:flutter_project/custom_widgets/customText.dart';

import '../custom_widgets/appImagePicker.dart';
import '../custom_widgets/customButton.dart';
import '../custom_widgets/textFormField.dart';
import '../utils/strings.dart';

class CreateAdScreen extends StatefulWidget {
  const CreateAdScreen({super.key});

  @override
  State<CreateAdScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CreateAdScreen> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _priceCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();
  TextEditingController _descriptionCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
              CustomTextForm().generalTextField(_nameCtrl, 'name'),
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
