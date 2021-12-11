import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Learn_English_Today/quizz/second_page.dart';
import 'package:Learn_English_Today/introduction_animation/components/home_page.dart';
class ScorePage extends StatefulWidget {
  final List useranswerlist;
  final List correctanswerlist;
  const ScorePage(
      {Key? key, required this.useranswerlist, required this.correctanswerlist})
      : super(key: key);

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int count = 0;
  int total = 0;

  @override
  void initState() {
    for (int i = 0; i < widget.correctanswerlist.length; i++) {
      if (widget.correctanswerlist.elementAt(i) ==
          widget.useranswerlist.elementAt(i)) {
        count++;
      }
    }
    count *= 10;
    total = widget.correctanswerlist.length * 10;
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle body = Theme.of(context).textTheme.bodyText1!;

    return Scaffold(
       backgroundColor: Color(0xffF7EBE1),
        appBar: AppBar(
          elevation: 0.0,
             backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: Text('English_today Result'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(48),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withAlpha(60),
                      blurRadius: 6.0,
                      spreadRadius: 4.0,
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Score",
                      style: GoogleFonts.lato(textStyle: body, fontSize: 30),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${count} / ${total}',
                      style: GoogleFonts.lato(textStyle: body, fontSize: 28),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Container(
              width: 200,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    primary: Colors.redAccent,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Retake Test',
                    style: GoogleFonts.lato(textStyle: body, fontSize: 20),
                  ),
                ),
              ),
            ),
             SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    primary: Colors.yellowAccent,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text(
                    'Home',
                    style: GoogleFonts.lato(textStyle: body, fontSize: 20),
                  ),
                ),
              ),
            ),
      
            SizedBox(
              height: 40,
            )
          ],
        ));
  }
}
