import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:historical_places/models/theme_preferences.dart';
import 'package:historical_places/providers/theme.dart';
import 'package:minimize_app/minimize_app.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';
import 'information_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectDrawerItem = 0;

  getDrawerItemWidget(int position){
    switch(position){
      case 0: return const HomeScreen();
      case 1: return const InformationScreen();
    }
  }

  onSelectItem(int position){
    Navigator.of(context).pop();
    setState((){
      selectDrawerItem = position;
    });
  }

  closeApp(){
    if(Platform.isAndroid){
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }else{
      MinimizeApp.minimizeApp();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).backgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Modo oscuro",
                    style: TextStyle(
                      color: Colors.white
                    )),
                  Switch(
                    activeColor: const Color(0xFFb57edc),
                    value: currentTheme.isDarkTheme(),
                    onChanged: (value){
                      String newTheme = value ? ThemePreference.DARK : ThemePreference.LIGHT;
                      currentTheme.setTheme = newTheme;
                    }
                  ),
                ],
              ),
            ),
            ListTile(
              selectedColor: const Color(0xFFb57edc),
              title: const Text("Principal"),
              leading: const Icon(Icons.home_filled),
              selected: (0 == selectDrawerItem),
              onTap: (){
                onSelectItem(0);
              },
            ),
            ListTile(
              selectedColor: const Color(0xFFb57edc),
              title: const Text("Acerca de"),
              leading: const Icon(Icons.info_rounded),
              selected: (1 == selectDrawerItem),
              onTap: (){
                onSelectItem(1);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor
      ),
      body: getDrawerItemWidget(selectDrawerItem),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFb57edc),
        onPressed: ()=> closeApp(),
        tooltip: 'Close app',
        child: const Icon(Icons.close),
      ),
    );
  }
}
