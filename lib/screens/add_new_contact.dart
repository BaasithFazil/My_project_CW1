import 'dart:io';
import 'package:content_buddy/model/model_class.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNew extends StatefulWidget {
  const AddNew({Key? key}) : super(key: key);

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  final ImagePicker _picker = ImagePicker();

  GlobalKey<FormState> contactkey = GlobalKey<FormState>();

  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  String? firstname;
  String? lastname;
  String? phonenumber;
  String? email;
  File? image;

  TextStyle mystyle = const TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Contact Details", style: TextStyle(color: Colors.black,),),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    backgroundImage: (image != null) ? FileImage(image!) : null,
                    backgroundColor: Colors.deepPurple,
                    radius: 50,
                    child: Text(
                      (image != null) ? "" : "ADD",
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.purpleAccent,
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                                'What do you want to take photos from?'),
                            actions: [
                              ElevatedButton(
                                onPressed: () async {
                                  XFile? pickedPhoto = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    image = File(pickedPhoto!.path);
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: const Text("ALBUMS"),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  XFile? pickedFile = await _picker.pickImage(
                                      source: ImageSource.camera);
                                  setState(() {
                                    image = File(pickedFile!.path);
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: const Text("CAMERA"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    mini: true,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Form(
                key: contactkey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          controller: firstnamecontroller,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Your First Name...";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              firstname = val;
                            });
                          },
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
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
                          controller: lastnamecontroller,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Your Last Name...";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              lastname = val;
                            });
                          },
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
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
                          controller: phonenumbercontroller,
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Your Number...";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              phonenumber = val;
                            });
                          },
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
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
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Your Email..";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            hintText: "Email",
                          ),
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: (){
                      if (contactkey.currentState!.validate()) {
                      contactkey.currentState!.save();

                      Contact c1 = Contact(
                        firstname: firstname,
                        lastname: lastname,
                        phonenumber: phonenumber,
                        email: email,
                        image: image,
                      );

                      setState(() {
                        Global.allcontacts.add(c1);
                      });

                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('homepage', (route) => false);
                }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                            ), 
                            child: const Text("Add Contacts", style: TextStyle(fontSize: 20, ),),
                            ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple
                    ), child: const Text("Go Back", style: TextStyle(fontSize: 20),
                    ),
                    ),
                    ],
                  ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
