import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Learn_English_Today/bloc/home_screen/home_bloc.dart';
import 'package:Learn_English_Today/introduction_animation/components/home_page.dart';
class ShareButton1 extends StatelessWidget {
  const ShareButton1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, state) {
        return IconButton(
          onPressed: () {
            if (state is HomeLoaded) {
             Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
            }
          },
          icon: Icon(
            Icons.ad_units,
            size: 25,
            color: Theme.of(context).iconTheme.color,
          ),
        );
      },
    );
  }
}
