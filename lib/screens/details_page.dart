
import 'package:content_buddy/model/model_class.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Contacts Details",
          style:
              TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              CircleAvatar(
                backgroundImage:
                    (res.image != null) ? FileImage(res.image!) : null,
                backgroundColor: Colors.grey,
                radius: 55,
                child: Text(
                  (res.image != null) ? "" : "ADD",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),

            Text(
              "Name: ${res.firstname} ${res.lastname}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

          const SizedBox(
            height: 30,
          ),
            Text(
              "Number: +91 ${res.phonenumber} ",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          const SizedBox(
            height: 15,
          ),

          Text("Email Address: ${res.email}",style: const TextStyle(fontSize: 16),),
          const SizedBox(
            height: 15,
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: (){
                Navigator.of(context).pushNamed('editpage', arguments: res);
              }, icon: const Icon(Icons.edit), label: const Text("Edit")),
              const SizedBox(
                width: 15.0,
              ),
              ElevatedButton.icon(onPressed: () async{
                await showDialog(context: context,
                 builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: const Text("Are you sure?"),
                      actions: [ 
                        TextButton(onPressed: (){
                          Navigator.of(dialogContext).pop();
                        }, child: const Text("No")),
                        TextButton(onPressed: (){
                          Global.allcontacts.remove(res);

                          Navigator.of(context).pushNamedAndRemoveUntil('homepage', (route) => false);
                        }, child: const Text("Yes"))
                      ],
                    );
                 },
                 );
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
              ),
              icon: const Icon(Icons.delete, color: Colors.red,), label: const Text("Delete")),

                const SizedBox(),

            ],
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
          ), child: const Text("Go Back"),
          
          ),
          
        ],
      ),
    );
  }
}
