import 'package:flutter/material.dart';
import 'package:mep/View/IntroPages/Setup.dart';
import 'package:mep/View/components/BlockedPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _shouldShowSetupPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? setupDate = prefs.getString("setup_date");
    print(setupDate);
    if (setupDate != null) {
      final DateTime lastSetupDate = DateTime.parse(setupDate);
      final DateTime now = DateTime.now();
      final Duration difference = now.difference(lastSetupDate);
      print(difference);
      // Simulate a 10-second difference for testing purposes
      if (difference.inDays >= 365) {
        return true;
      }
    }
    return false;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 72, 72, 72)),
        fontFamily: 'AbyssinicaSIL-Regular',
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: _shouldShowSetupPage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // You can display a loading indicator while checking.
          } else if (snapshot.hasError) {
            return Center(child: Text('Error')); // Handle errors if needed.
          } else if (snapshot.data == false) {
            return SetupPage();
          } else {
            return BlockedPage(); // Display an empty container or any other widget as needed.
          }
        },
      ),
    );
  }
}
