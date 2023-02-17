import 'package:flutter/material.dart';

class HistoricalPlaceDetail extends StatelessWidget {
  var place = {};
  HistoricalPlaceDetail({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              child: const Icon( Icons.arrow_circle_left_sharp, color: Colors.white, size: 40),
              onTap: () {
                Navigator.pop(context);
              } ,
            ) ,
            toolbarHeight: 70,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      place['name'],
                      style: const TextStyle(
                        fontSize: 26.0,
                        color: Color(0xFF7f4ca5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        place['location'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                place['image'],
                width: double.maxFinite,
                fit: BoxFit.cover, //Adapt to the container
              ), //Background image
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    place['description'],
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 18,
                      wordSpacing: 5
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Text(
                      'Informatica obtenida de: ' + place['reference'],
                      style: const TextStyle(
                        fontSize: 16
                      ),
                    ),
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
