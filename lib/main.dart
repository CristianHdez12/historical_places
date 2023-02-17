import 'package:flutter/material.dart';
import 'package:historical_places/providers/theme.dart';
import 'package:historical_places/screens/main_screen.dart';
import 'package:historical_places/utils/Styles.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  getCurrentAppTheme() async{
    themeChangeProvider.setTheme = await themeChangeProvider.themePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<ThemeProvider>(
          builder: (context, value, child){
            return MaterialApp(
              debugShowCheckedModeBanner: false, //Hide the debug banner
              title: 'Lugares históricos',
              theme: Styles.themeData(themeChangeProvider.isDarkTheme(), context),
              home: MainScreen(),
            );
          }),
    );
  }
}

