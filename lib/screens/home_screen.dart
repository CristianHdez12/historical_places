import 'package:flutter/material.dart';
import 'package:historical_places/components/carousel_slider.dart';

import 'gridview_items_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
          child: ListView(
            children: [
              _historicalPlaces(),
              _sevenWonders(),
            ],
          )
      ),
    );
  }
  
  Widget _historicalPlaces(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Lugares históricos",
                style: TextStyle(
                  color: Color(0xFF7f4ca5),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const GridViewItems()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const  Color(0xFFb57edc)
                  ),
                  child: const Text("Ver más"),
              ),
            ],
          ),
        ),

        Carousel(),  //Carousel of historical places
      ],
    );
  }

  Widget _sevenWonders(){
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 20.0),
          child: const Text(
            "Las 7 maravillas del mundo",
            style: TextStyle(
              color: Color(0xFF7f4ca5),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        Carousel(type: "seven_wonders"),  //Carousel of the seven wonders of the world
      ],
    );
  }

  Widget _sevenWondersAncient(){
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 20.0),
          child: const Text(
            "Las 7 maravillas del mundo antiguo",
            style: TextStyle(
                color: Color(0xFF7f4ca5)
            ),
          ),
        ),
        Carousel(type: "seven_wonders_ancient"),  //Carousel of the seven wonders of the world
      ],
    );
  }
}
