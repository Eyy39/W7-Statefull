import 'package:flutter/material.dart';

// EX 4 – Score bar (BONUS, free style: handout page EX 4)
// The design, the widgets and the data are up to you.

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.lightGreen,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 30,
                children: [
                  ScoreCard(title: "My score in Flutter"),
                  ScoreCard(title: "My score in Dart"),
                  ScoreCard(title: "My score in React"),
                ],
              )
            ),
          ),
        ) // YOUR CODE
        ),
  );
}

class ScoreCard extends StatefulWidget {
  const ScoreCard({
    super.key,
    required this.title,
    this.initailScore = 0,
    this.maxScore = 10,
  });
  final String title;
  final int initailScore;
  final int maxScore;

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int score = 0;
  Color get cardColor {
    if (score <= 3) {
      return Colors.green.shade300;
    } else if (score <= 7) {
      return Colors.green.shade500;
    } else if (score <= 10) {
      return Colors.green.shade900;
    } else {
      return Colors.grey.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 80,
              children: [
                IconButton(
                    onPressed: () => setState(() {
                          if (score > 0) score--;
                        }),
                    icon: Icon(Icons.remove)),
                IconButton(
                    onPressed: () => setState(() {
                          if (score < widget.maxScore) score++;
                        }),
                    icon: Icon(Icons.add)),
              ],
            ),
            ScoreBar(
              barColor: cardColor,
              score: score,
              maxScore: widget.maxScore,
            ),
          ],
        ));
  }
}

class ScoreBar extends StatelessWidget {
  const ScoreBar({
    super.key,
    required this.score,
    required this.maxScore,
    required this.barColor,
  });
  final int score;
  final int maxScore;
  final Color barColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade400)),
      child: Row(
        children: [
          if (score > 0)
            Expanded(
                flex: score,
                child: Container(
                  decoration: BoxDecoration(
                      color: barColor, borderRadius: BorderRadius.circular(9)),
                )),
          if (maxScore - score > 0)
            Expanded(flex: maxScore - score, child: SizedBox()),
        ],
      ),
    );
  }
}
