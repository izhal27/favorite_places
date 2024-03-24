import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class DetailPlace extends StatelessWidget {
  const DetailPlace({required this.place, super.key});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
    );
  }
}
