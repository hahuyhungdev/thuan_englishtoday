import 'dart:io';
import 'package:Learn_English_Today/app_theme.dart';
import 'package:Learn_English_Today/packages/quote/quote.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'introduction_animation/introduction_animation_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Learn_English_Today/bloc/home_screen/favorite_button/favorite_bloc.dart';
import 'package:Learn_English_Today/bloc/home_screen/home_bloc.dart';
import 'package:Learn_English_Today/bloc/home_screen/load_quote_button/quote_button_bloc.dart';
import 'package:Learn_English_Today/bloc/network_connectivity/network_connectivity_bloc.dart';
import 'package:Learn_English_Today/bloc/simple_bloc_observer.dart';
import 'package:Learn_English_Today/data/repository/quote_repository.dart';
import 'package:Learn_English_Today/ui/home/home.dart';
import 'package:Learn_English_Today/ui/saved_quotes/saved_quotes_screen.dart';
import 'package:Learn_English_Today/ui/splash/splash_screen.dart';
import 'package:Learn_English_Today/utils/constants/theme_const.dart';
import 'package:Learn_English_Today/utils/constants/ui_const.dart';

import 'bloc/initialization/initialization_bloc.dart';
import 'bloc/saved_quotes_screen/saved_quote_bloc.dart';


class Quoctespage extends StatefulWidget {
  const Quoctespage({Key? key}) : super(key: key);

  @override
  _QuoctespageState createState() => _QuoctespageState();
}

class _QuoctespageState extends State<Quoctespage> {
  @override
  Widget build(BuildContext context) {
    final QuoteRepository quoteRepository = QuoteRepository();

    return RepositoryProvider(
      create: (context) => quoteRepository,
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<QuoteRepository>(
              create: (context) => quoteRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              lazy: false,
              create: (context) => InitializationBloc()
                ..add(
                  InitializeApp(),
                ),
            ),
            BlocProvider(
              lazy: false,
              create: (context) => NetworkConnectivityBloc(),
            ),
            BlocProvider(
              create: (context) => HomeBloc(
                quoteRepository:
                    RepositoryProvider.of<QuoteRepository>(context),
              ),
            ),
            BlocProvider(
              lazy: false,
              create: (context) => QuoteButtonBloc(
                homeBloc: BlocProvider.of<HomeBloc>(context),
              ),
            ),
            BlocProvider(
              create: (context) => FavoriteBloc(
                  quoteRepository:
                      RepositoryProvider.of<QuoteRepository>(context)),
            ),
            BlocProvider(
              create: (context) => SavedQuotesBloc(
                quoteRepository:
                    RepositoryProvider.of<QuoteRepository>(context),
              ),
            ),
          ],
          child: MaterialApp(
            title: UiConst.appName,
           
            initialRoute: UiConst.splashScreenRoute,
            routes: {
              UiConst.splashScreenRoute: (context) => const SplashScreen(),
              UiConst.homeScreenRoute: (context) => const HomeScreen(),
              UiConst.savedQuotesScreenRoute: (context) =>
                  const SavedQuotesScreen(),
            },
          ),
        ),
      ),
    );
  }
}
