import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Learn_English_Today/models/user.dart';

import 'package:Learn_English_Today/utils/user_preferences.dart';
import 'package:Learn_English_Today/widgets/appbar_widget.dart';
import 'package:Learn_English_Today/widgets/button_widget.dart';
import 'package:Learn_English_Today/widgets/numbers_widget.dart';
import 'package:Learn_English_Today/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Color(0xffF7EBE1),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0,0),
            child: ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {},
            ),
          ),
          const SizedBox(height: 13),
          buildName(user),
          const SizedBox(height: 13),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 1),
          NumbersWidget(),
          const SizedBox(height: 13),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Back-End Developer',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 10, 20),
              child: Text(
                user.about,
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
            ),
            Image.network(  
                  'https://user-images.githubusercontent.com/67463412/129671456-61ef0d33-44b3-472d-916b-8dbad6b628a0.gif',  
                  height: 150,  
                  width: 200  
              ),  
          ],
        ),
      );
}
