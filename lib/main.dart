import 'package:flutter/material.dart';
import 'package:shopping_app/screens/splashscreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://zuuxfwhhnersdowolskd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp1dXhmd2hobmVyc2Rvd29sc2tkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM4MDI3MTQsImV4cCI6MjA2OTM3ODcxNH0.7htdsCZX3hy67JI2DZVyesOYtZRfOgm2F31nPNRumuM',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {'/': (context) => const SplashScreen()},
    );
  }
}
