import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Learn_English_Today/bloc/home_screen/home_bloc.dart';
import 'package:Learn_English_Today/bloc/home_screen/load_quote_button/quote_button_bloc.dart';
import 'package:Learn_English_Today/bloc/network_connectivity/network_connectivity_bloc.dart';

/// Widget that handles quote request
class QuoteButton extends StatefulWidget {
  const QuoteButton({Key? key}) : super(key: key);

  @override
  _QuoteButtonState createState() => _QuoteButtonState();
}

class _QuoteButtonState extends State<QuoteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuoteButtonBloc, QuoteButtonState>(
      listener: (BuildContext context, state) {
        if (state is QuoteButtonPressed) {
          // Do Icon Rotation
          _controller.reset();
          _controller.forward();
        }
      },
      child: BlocBuilder<NetworkConnectivityBloc, NetworkConnectivityState>(
        builder: (BuildContext context, state) {
          return ElevatedButton(
            onPressed: () {
              // Based on the network connection, do request
              if (state is NetworkConnectionUpdatedState) {
                BlocProvider.of<HomeBloc>(context).add(GetRandomQuote());
              } else if (state is NoNetworkConnectionState) {
                BlocProvider.of<HomeBloc>(context).add(NoNetworkRequest());
              }
            },
            child: Center(
              child: RotationTransition(
                turns: Tween(begin: 0.5, end: 0.0).animate(_controller),
                child: const Icon(
                  Icons.sync,
                  size: 35,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(80, 80),
              primary: Theme.of(context).primaryColor,
              shape: const CircleBorder(
                side: BorderSide.none,
              ),
            ),
          );
        },
      ),
    );
  }
}
