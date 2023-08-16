/*
 *Technical Programming III Assignment
 * S Nkosi
 * Main Sceern
 */

import 'package:flutter/material.dart';
import 'package:flutter_units_app/models/Units_JsonFile.dart';
import 'package:flutter_units_app/routes/route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TheJsonFile(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey[600]),
            ),
            appBarTheme: AppBarTheme(color: Colors.blueGrey[600]),
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteManager.firstsheet,
          onGenerateRoute: RouteManager.onGenerateRoute,
        );
      },
    );
  }
}
