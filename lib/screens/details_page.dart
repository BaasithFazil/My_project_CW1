
import 'package:content_buddy/constants/constants.dart';
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
        backgroundColor: MyColors.primarywhite,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Contacts Details",
          style:
              TextStyle(color: MyColors.primaryblack),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyStyle.sizedbox1,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyStyle.spacer1,
              CircleAvatar(
                backgroundImage:
                    (res.image != null) ? FileImage(res.image!) : null,
                backgroundColor: Colors.grey,
                radius: 55,
                child: Text(
                  (res.image != null) ? "" : "ADD",
                  style: MyStyle.avatarStyle,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
          MyStyle.sizedbox5,

            Text(
              "Name: ${res.firstname} ${res.lastname}",
              style: MyStyle.firstName,
            ),

          MyStyle.sizedbox5,
            Text(
              "Number: +94 ${res.phonenumber} ",
              style: MyStyle.phoneNumber,
            ),
          MyStyle.sizedbox2,
          Text("Email Address: ${res.email}",style: MyStyle.emailAddress),
          MyStyle.sizedbox4,


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: (){
                Navigator.of(context).pushNamed('editpage', arguments: res);
              }, icon: const Icon(Icons.edit), label: const Text("Edit"), style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.primarydeeppurple,
              ),),
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
                        }, child: const Text("No", style: TextStyle(color: MyColors.primarydeeppurple),)),
                        TextButton(onPressed: (){
                          Global.allcontacts.remove(res);

                          Navigator.of(context).pushNamedAndRemoveUntil('homepage', (route) => false);
                        }, child: const Text("Yes", style: TextStyle(color: MyColors.primarydeeppurple),))
                      ],
                    );
                 },
                 );
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.primarypurple,
              ),
              icon: MyStyle.deleteIcon, label: const Text("Delete")),

                MyStyle.sizedbox3,

            ],
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primarypurple,
          ), child: const Text("Go Back"),
          
          ),
          
        ],
      ),
    );
  }
}
