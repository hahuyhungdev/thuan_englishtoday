import 'package:flutter/material.dart';
import 'package:Learn_English_Today/values/app_styles.dart';
import 'package:Learn_English_Today/values/app_colors.dart';
import 'package:Learn_English_Today/values/app_assets.dart';
import 'package:Learn_English_Today/introduction_animation/components/relax_view.dart';
import 'package:Learn_English_Today/introduction_animation/components/home_page.dart';

class WelcomeView extends StatelessWidget {
  final AnimationController animationController;
  const WelcomeView({Key? key, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.6,
          0.8,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          0.8,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _welcomeFirstHalfAnimation =
        Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final _welcomeImageAnimation =
        Tween<Offset>(begin: Offset(4, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _imageFirstHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.4,
        0.6,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    final _imageSecondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0.5))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SlideTransition(
              //   position: _welcomeImageAnimation,
              //   child: Container(
              //     constraints: BoxConstraints(maxWidth: 350, maxHeight: 350),
              //     child: Image.asset(
              //       'assets/introduction_animation/welcome.png',
              //       fit: BoxFit.contain,
              //     ),
              //   ),
              // ),

              SlideTransition(
                position: _welcomeFirstHalfAnimation,

                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Welcome to',
                    style: AppStyles.h3.copyWith(
                        color: AppColors.blackGrey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // child: Text(
                //   "Welcome to",
                //   style: AppStyles.h3.copyWith(
                //       color: AppColors.blackGrey, fontWeight: FontWeight.bold),
                // ),
              ),
              Text(
                'English',
                style: AppStyles.h2.copyWith(
                    height: 2.0,
                    color: AppColors.blackGrey,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Text(
                  'Ha Huy Hung ',
                  textAlign: TextAlign.right,
                  style: AppStyles.h4.copyWith(
                      height: 5.0,
                      color: AppColors.blackGrey,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextButton.icon(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onPressed: () {},
                label: Text(
                  'Mình là sinh viên TDTU',
                  //ngay23 có gì hot
                  //ngay22 là ngày hôm qua phải hong
                  textAlign: TextAlign.right,
                  style: AppStyles.h4.copyWith(color: AppColors.blackGrey),
                ),
              ),
              SlideTransition(
                position: _imageFirstHalfAnimation,
                child: SlideTransition(
                  position: _imageSecondHalfAnimation,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 250, maxHeight: 150),
                    child: Image.asset(
                      'assets/introduction_animation/mood_dairy_image.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
