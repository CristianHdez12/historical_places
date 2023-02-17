import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:historical_places/components/item_historical_place.dart';

class GridViewItems extends StatefulWidget {
  const GridViewItems({Key? key}) : super(key: key);

  @override
  State<GridViewItems> createState() => _GridViewItemsState();
}

class _GridViewItemsState extends State<GridViewItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('historicalPlaces').orderBy("name").get(),
        builder: (context, snapshot){
          if (snapshot.hasError) {
            return const Text("Error al obtener los elementos");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Create a grid with 2 columns
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ((context, index){
                return ItemHistoricalPlace(place: snapshot.data!.docs[index].data() as Map<String, dynamic>, itemsStyle: 'Grid');
              })
            ),
          );
        },
      ),
    );
  }
}
