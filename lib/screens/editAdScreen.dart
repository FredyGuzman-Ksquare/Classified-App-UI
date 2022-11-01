import 'package:flutter/material.dart';

import '../custom_widgets/AppImagePicker.dart';

class EditAdScreen extends StatefulWidget {
  const EditAdScreen({super.key});

  @override
  State<EditAdScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditAdScreen> {
  TextEditingController _nameCtrl =
      TextEditingController(text: 'Used Macbook Pro for Sale');
  TextEditingController _priceCtrl = TextEditingController(text: '45000');
  TextEditingController _mobileCtrl =
      TextEditingController(text: '+52 1 9621894299');
  TextEditingController _descriptionCtrl = TextEditingController(
      text: 'alidafaoifldfjkgkjdlfghdflkdhfdajkslfhdakjlfhkasldfhklsdaf');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Ad'),
          leading: Icon(Icons.arrow_back),
          centerTitle: true,
          backgroundColor: Colors.black,
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
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _nameCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Name",
                    labelStyle: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 230, 230, 230),
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _priceCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Price",
                    labelStyle: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 230, 230, 230),
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _mobileCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Contact Number",
                    labelStyle: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 230, 230, 230),
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _descriptionCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Description",
                    labelStyle: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 230, 230, 230),
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.only(
                            top: 15, bottom: 15, right: 25, left: 25)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffF25723)),
                  ),
                  child: const Text(
                    "Submit Ad",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
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
