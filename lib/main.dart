import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prototype/article/article_screen.dart';
import 'package:prototype/journal/new_journal.dart';
import 'package:prototype/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

import 'package:prototype/auth/screen/authentication.dart';
import './journal/provider/journal.dart';
import './journal/provider/journal_provider.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => JournalProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Journal(),
        )
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          scaffoldBackgroundColor: kBackgroundColor,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, userSnapshot) {
              if (userSnapshot.hasData) {
                return Home();
              }
              return Authentication();
            }),
        routes: {
          "/newJournal": (context) => NewJournal(),
          "/article": (context) => ArticleScreen(),
        },
      ),
    );
  }
}
