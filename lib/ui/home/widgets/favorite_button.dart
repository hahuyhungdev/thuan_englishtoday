import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Learn_English_Today/bloc/home_screen/favorite_button/favorite_bloc.dart';
import 'package:Learn_English_Today/bloc/home_screen/home_bloc.dart';

/// Widget that saves or removes quotes from the database
class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  // Tracks if the favorite button has been pressed in
  var isPressed = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (BuildContext context, state) {
        if (state is HomeLoading) {
          BlocProvider.of<FavoriteBloc>(context).add(ResetFavoriteButton());
        }
      },
      child: BlocListener<FavoriteBloc, FavoriteState>(
        listener: (BuildContext context, state) {
          if (state is FavoriteUnpressed) {
            isPressed = false;
            setState(() {});
          } else if (state is FavoritePressed) {
            isPressed = true;
            setState(() {});
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, homeState) {
            return IconButton(
              onPressed: () {
                if (homeState is HomeLoaded) {
                  // Add or Remove the current quote from DB, based on the button state
                  switch (isPressed) {
                    case true:
                      BlocProvider.of<FavoriteBloc>(context).add(
                          RemoveQuoteToFavorites(quote: homeState.randomQuote));
                      break;
                    case false:
                      BlocProvider.of<FavoriteBloc>(context).add(
                          AddQuoteToFavorites(newQuote: homeState.randomQuote));
                      break;
                  }
                }
              },
              icon: Icon(
                isPressed ? Icons.bookmark : Icons.bookmark_add_outlined,
                size: 25,
                color: Theme.of(context).iconTheme.color,
              ),
            );
          },
        ),
      ),
    );
  }
}
