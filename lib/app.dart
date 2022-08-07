import 'package:flutter/material.dart';

import 'package:mofdin/ui/game_layout.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MofDin 2D Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GameLayout(),
    );
  }
}
