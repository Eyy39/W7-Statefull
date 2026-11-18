// EX 3 – The image gallery (handout page: EX 3). Start code from the handout.
// The images are in assets/w4-s2/: declare them in pubspec.yaml yourself.

import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: HomeSection(),
    ));

class HomeSection extends StatefulWidget {
  const HomeSection({
    super.key,
  });

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  int currentPic = 0;
  void _goToNext(){
    setState(() {
      if(currentPic < images.length -1){
        currentPic++;
      }else{
        currentPic = 0;
      }
    });
  }
  void _goToPreviouse(){
    setState(() {
      if(currentPic > 0){
        currentPic--;
      }else{
        currentPic= images.length-1;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: _goToPreviouse,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: _goToNext,
            ),
          ),
        ],
      ),
      body: Image.asset(images[currentPic],width: double.infinity, fit: BoxFit.fitWidth,),
    );
  }
}
