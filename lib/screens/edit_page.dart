import 'dart:io';

import 'package:flutter/material.dart';
import '../model/model_class.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final GlobalKey<FormState> _editcontactkey = GlobalKey<FormState>();

  final TextEditingController _firstnamecontroller = TextEditingController();
  final TextEditingController _lastnamecontroller = TextEditingController();
  final TextEditingController _phonenumbercontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();

  String? _firstname;
  String? _lastname;
  String? _phonenumber;
  String? _email;
  File? _image;

  TextStyle mystyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    _firstnamecontroller.text = data.firstname;
    _lastnamecontroller.text = data.lastname;
    _phonenumbercontroller.text = data.phonenumber;
    _emailcontroller.text = data.email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Edit Details",
          style:
              TextStyle(color: Colors.black),
        ),
      ),
      body: ColorfulSafeArea(
        color: Colors.white,
        child: Form(
          key: _editcontactkey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "First Name",
                    style: mystyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _firstnamecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Your First Name...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _firstname = val;
                      });
                    },
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: "First Name"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Last Name",
                    style: mystyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _lastnamecontroller,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Your Last Name...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _lastname = val;
                      });
                    },
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: "Last Name"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Phone Number",
                    style: mystyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _phonenumbercontroller,
                    keyboardType: TextInputType.phone,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Your Number...";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _phonenumber = val;
                      });
                    },
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: "+91 0000000000"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Email",
                    style: mystyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Your Email..";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _email = val;
                      });
                    },
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: "Email"),
                  ),

                  Row(
                    children: [
                      ElevatedButton.icon(onPressed: (){
                        Navigator.of(context).pop();
                          _firstnamecontroller.clear();
                          _lastnamecontroller.clear();
                          _phonenumbercontroller.clear();
                          _emailcontroller.clear();
                        setState(() {
                            _firstname = "";
                            _lastname = "";
                            _phonenumber = "";
                            _email = "";
                          });
                      }, icon: const Icon(Icons.arrow_back), label: const Text("Go Back")),

                  const SizedBox(
                    width: 15.0,
                  ),

                  ElevatedButton.icon(onPressed: (){
                    if (_editcontactkey.currentState!.validate()) {
                  _editcontactkey.currentState!.save();

                  Contact c = Contact(
                    firstname: _firstname,
                    lastname: _lastname,
                    phonenumber: _phonenumber,
                    email: _email,
                    image: _image,
                  );

                  int i = Global.allcontacts.indexOf(data);

                  Global.allcontacts[i] = (c);

                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('homepage', (route) => false);
                }
                  }, icon: const Icon(Icons.update), label: const Text("Update Details")),
        
        
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
