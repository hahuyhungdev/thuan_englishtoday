import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Learn_English_Today/bloc/home_screen/home_bloc.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, state) {
        return IconButton(
          onPressed: () {
            if (state is HomeLoaded) {
              BlocProvider.of<HomeBloc>(context).add(
                ShareQuote(shareQuote: state.randomQuote),
              );
            }
          },
          icon: Icon(
            Icons.share,
            size: 25,
            color: Theme.of(context).iconTheme.color,
          ),
        );
      },
    );
  }
}
