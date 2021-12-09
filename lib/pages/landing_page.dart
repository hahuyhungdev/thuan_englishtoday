import 'package:Learn_English_Today/pages/home_page.dart';
import 'package:Learn_English_Today/values/app_assets.dart';
import 'package:Learn_English_Today/values/app_colors.dart';
import 'package:Learn_English_Today/values/app_styles.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent[100],
      appBar: AppBar(
        title: Text('English Today'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            Expanded(           
              child: Container(
                
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome to',
                  
                  style: AppStyles.h3.copyWith(

                          // color: AppColors.blackGrey,
                          fontWeight: FontWeight.bold),
                  
                ),
              ),
            ),
          
            Expanded(

              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'English',
                      style: AppStyles.h2.copyWith(
                          color: AppColors.blackGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Text(
                        'Huy Hung ',
                        textAlign: TextAlign.right,
                        style: AppStyles.h4.copyWith(height: 2.5,
                          color: Colors.red,
                          letterSpacing:  2.0,
                          
                        ),
                        
                      ),
                    ),
                  ],
                  
                ),
              ),
            ),
            TextButton.icon (

                 icon: Icon(Icons.favorite),
  onPressed: () {},
  label: Text('Bọn mình là sinh viên TDTU',
  textAlign: TextAlign.right,
  style: AppStyles.h4.copyWith(height: 2.5,
                          color: AppColors.blackGrey),
  ),
),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: RawMaterialButton(
                  shape: CircleBorder(),
                  fillColor: AppColors.lighBlue,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                            (route) => false);
                  },
                  child: Text('Start'
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
