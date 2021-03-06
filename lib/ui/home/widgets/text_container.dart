import 'package:flutter/material.dart';
import 'package:Learn_English_Today/data/model/quote.dart';

/// Widget that displays the quote from [Quote]
class TextContainer extends StatefulWidget {
  final Quote? randomQuote;

  const TextContainer({Key? key, this.randomQuote}) : super(key: key);

  @override
  _TextContainerState createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 30,
        left: 30,
        top: (MediaQuery.of(context).size.height) * 0.1,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.randomQuote != null
                ? widget.randomQuote!.quote.toString()
                : "",
            textAlign: TextAlign.center,
            style: Theme.of(context).primaryTextTheme.headline6,
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height) * 0.06,
          ),
          Text(
            widget.randomQuote != null
                ? "- ${widget.randomQuote!.author.toString()}"
                : "",
            textAlign: TextAlign.center,
            style: Theme.of(context).primaryTextTheme.headline5,
          ),
        ],
      ),
    );
  }
}
