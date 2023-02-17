import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:historical_places/components/item_historical_place.dart';

class Carousel extends StatefulWidget {
  String type;

  Carousel({super.key,this.type=""});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: widget.type == "seven_wonders" ? FirebaseFirestore.instance.collection('historicalPlaces').where("tags", arrayContains: "seven_wonders").get()
            : widget.type == "seven_wonders_ancient" ? FirebaseFirestore.instance.collection('historicalPlaces').where("tags", arrayContains: "seven_wonders_ancient").get()
            : FirebaseFirestore.instance.collection('historicalPlaces').limit(10).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error al obtener los elementos");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              reverse: false,
              viewportFraction: 0.85,
              height: 220.0
            ),
            items: snapshot.data!.docs.map((doc) => ItemHistoricalPlace(place: doc.data() as Map<String, dynamic>, itemsStyle: 'Carousel')).toList(),
          );
        });
  }
}
