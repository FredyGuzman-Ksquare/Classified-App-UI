import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditProfileScreen> {
  TextEditingController _nameCtrl = TextEditingController(text: 'Fredy Guzmán');
  TextEditingController _emailCtrl =
      TextEditingController(text: 'fredyogr@gmail.com');
  TextEditingController _mobileCtrl =
      TextEditingController(text: '+52 1 9621894299');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
          centerTitle: true,
          leading: Icon(Icons.arrow_back),
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
              CircleAvatar(
                backgroundImage: AssetImage('graphics/logo.png'),
                backgroundColor: Colors.black,
                radius: 50,
              ),
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
                controller: _emailCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Email",
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
                    labelText: "Mobile",
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
                    "Update Profile",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
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
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.only(
                            top: 15, bottom: 15, right: 25, left: 25)),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffF25723)),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
