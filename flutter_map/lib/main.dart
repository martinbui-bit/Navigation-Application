import 'package:flutter/material.dart';

import 'currentlocationselectpage.dart';
import 'homepage.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/selectCPage': (context) => ChooseLocation(),
        '/home': (context) => const Home(),
      },
      theme: ThemeData(primarySwatch: Colors.red),
    ));
