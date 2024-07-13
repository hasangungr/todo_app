import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/view/home/home_provider.dart';

import 'product/route/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData(backgroundColor: Colors.grey),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          scaffoldBackgroundColor: Colors.grey.shade300,
          useMaterial3: true,
        ),
      ),
    );
  }
}


//textstyle font 
//theme 
//crud
//cache network
//alarm and delay vb
//exception 
