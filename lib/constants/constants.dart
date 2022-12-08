import 'package:flutter/material.dart';

class AppColors{
  static Color primaryColorLight = Colors.white;
  static Color secondaryColorLight = Colors.yellow;

  static Color primaryColorDark = Colors.black;
  static Color secondaryColorDark = Colors.purpleAccent;
}

class MyColors {
  static const primarypurple = Colors.purple;
  static const primarydeeppurple = Colors.deepPurple;
  static const primarywhite = Colors.white;
  static const primaryblack = Colors.black;
  static const primarygrey = Colors.grey;
  static const primarypurpleaccent = Colors.purpleAccent;
}


class MyRadius {
  static final primaryradius = BorderRadius.circular(15.0);
}

class MyPadding {
  static const primaryPadding = EdgeInsets.all(15.0);
  static const paddingsecond = EdgeInsets.all(20.0);

}

class MyStyle {
  static const avatarStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  static const firstName = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const phoneNumber = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold
  );

  static const emailAddress = TextStyle(
    fontSize: 16,
  );
    
  static const formStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const formlabel = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const sizedbox1 = SizedBox(height: 10.0,);
  static const sizedbox2 = SizedBox(height: 15.0,);
  static const sizedbox3 = SizedBox(width: 15.0,);
  static const sizedbox4 = SizedBox(height: 20.0,);
  static const sizedbox5 = SizedBox(height: 30.0,);
  static const sizedbox6 = SizedBox(height: 5.0,);

  static const spacer1 = Spacer(flex: 2,);

  static const addIcon = Icon(Icons.add);
  static const deleteIcon = Icon(Icons.delete);
  static const arrowBackIcon = Icon(Icons.arrow_back);
}


