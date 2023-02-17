import 'package:flutter/material.dart';
import 'package:historical_places/screens/historical_place_detail_screen.dart';

class ItemHistoricalPlace extends StatefulWidget {
  var place = {};
  String itemsStyle;
  ItemHistoricalPlace(
      {super.key, required this.place, required this.itemsStyle});

  @override
  State<ItemHistoricalPlace> createState() => _ItemHistoricalPlaceState();
}

class _ItemHistoricalPlaceState extends State<ItemHistoricalPlace> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: widget.itemsStyle == "Carousel"
            ? const EdgeInsets.only(right: 15.0, bottom: 20.0)
            : const EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  widget.place['image'],
                ),
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 10.0,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                widget.itemsStyle == "Carousel" ? _itemCarousel() : _itemGrid(),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HistoricalPlaceDetail(place: widget.place)));
        });
      },
    );
  }

  Widget _itemCarousel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Opacity(
          opacity: 0.7,
          child: Container(
            color: Colors.black,
            child: Text(
              widget.place['name'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _itemGrid(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Opacity(
          opacity: 0.7,
          child: Container(
            color: Colors.black,
            child: Text(
              widget.place['name'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

}
