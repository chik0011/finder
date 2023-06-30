import 'package:flutter/material.dart';
import 'package:finder/screen/bachelorsMaster.dart';
import 'package:provider/provider.dart';
import 'package:finder/provider/bachelorsProvider.dart';
import 'package:finder/provider/bachelorsLikedProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const BachelorsMaster bachelorsMaster =
      BachelorsMaster(title: 'Finder');

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BachelorsProvider()),
        ChangeNotifierProvider(create: (_) => BachelorsLikedProvider())
      ],
      child: MaterialApp(
        title: 'Finder',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFEFEFEF),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: bachelorsMaster,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
