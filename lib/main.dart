import 'package:flutter/material.dart';
import 'package:finder/screen/bachelorsMaster.dart';
import 'package:provider/provider.dart';
import 'package:finder/provider/bachelorsProvider.dart';
import 'package:finder/provider/bachelorsLikedProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:finder/screen/bachelorsLiked.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => bachelorsMaster,
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) => bachelorsMaster,
      ),
      GoRoute(
        path: "/liked",
        builder: (context, state) => bachelorsLiked,
      )
    ],
  );

  static const BachelorsMaster bachelorsMaster =
      BachelorsMaster(title: 'Finder');
  static BachelorsLiked bachelorsLiked = BachelorsLiked(title: 'Finder');

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BachelorsProvider()),
        ChangeNotifierProvider(create: (_) => BachelorsLikedProvider())
      ],
      child: MaterialApp.router(
        title: 'Finder',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFEFEFEF),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
