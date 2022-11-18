import 'dart:io';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';
import '../model/model_class.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          
          backgroundColor: Colors.red,
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                child: Text("Drawer Header"),
              ),
              ListTile(
                title: Text("Item1")
              ),
            ],
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Content Buddy",
            style:
                TextStyle(color: Colors.black, fontSize: 25),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert,
                  color:Colors.black),
            ),
          ],
        ),
        floatingActionButton:  FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                Navigator.of(context).pushNamed('newcontact');
              });
            },
          ),
    
        body: (Global.allcontacts.isEmpty) ? Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.add_box,
                      size: 100,
                      color:  Colors.purpleAccent,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You Don't have any contacts yet",
                      style: TextStyle(
                        color:Colors.black,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: Global.allcontacts.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('detail', arguments: Global.allcontacts[i]);
                    },
                    leading: CircleAvatar(
                      backgroundImage: (Global.allcontacts[i].image != null)
                          ? FileImage(Global.allcontacts[i].image as File)
                          : null,
                    ),
                    title: Text(
                      "${Global.allcontacts[i].firstname} ${Global.allcontacts[i].lastname}",
                      style: const TextStyle(
                          color: Colors.black),
                    ),
                    subtitle: Text(
                      "+91 ${Global.allcontacts[i].phonenumber} ",
                      style: const TextStyle(
                          color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.phone),
                      color: Colors.green,
                      onPressed: () async {
                        Uri url = Uri.parse(
                            "tel:+91${Global.allcontacts[i].phonenumber}");
    
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Can't be launched..."),
                              backgroundColor: Colors.redAccent,
                              behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
