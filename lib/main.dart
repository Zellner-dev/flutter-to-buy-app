import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_buy/providers/wished_list.dart';
import 'package:to_buy/routes/app_routes.dart';
import 'package:to_buy/screens/home_page.dart';
import 'package:to_buy/screens/to_buy_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => WishedList()),
      child: MaterialApp(
        title: 'To Buy App,',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: const Color(0XFF541431),
            secondary: const Color (0XFF8f0744)
          )
        ),
        routes: {
          AppRoutes.HOME :(context) => const HomePage(),
          AppRoutes.TO_BUY :(context) => const ToBuyScreen()
        },
      ),
    );
  }
}

