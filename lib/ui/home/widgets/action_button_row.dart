import 'package:Learn_English_Today/ui/home/widgets/share_button1.dart';
import 'package:flutter/material.dart';
import 'package:Learn_English_Today/ui/home/widgets/quote_button.dart';
import 'package:Learn_English_Today/ui/home/widgets/share_button.dart';

import 'favorite_button.dart';

/// Row Widget that contains the buttons with the most imported features
class ActionButtonRow extends StatefulWidget {
  const ActionButtonRow({Key? key}) : super(key: key);

  @override
  _ActionButtonRowState createState() => _ActionButtonRowState();
}

class _ActionButtonRowState extends State<ActionButtonRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        FavoriteButton(),
        QuoteButton(),
        ShareButton(),
        ShareButton1(),
      ],
    );
  }
}
