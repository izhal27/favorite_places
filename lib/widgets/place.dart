import 'package:flutter/material.dart';

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/widgets/new_place.dart';

class PlaceWidget extends StatefulWidget {
  const PlaceWidget({super.key});

  @override
  State<PlaceWidget> createState() => _PlaceWidgetState();
}

class _PlaceWidgetState extends State<PlaceWidget> {
  final List<Place> _listOfPlaces = [];

  void _addPlace() async {
    final result = await Navigator.of(context).push<Place>(
      MaterialPageRoute(builder: (context) => const NewPlace()),
    );
    if (result != null) {
      setState(() {
        _listOfPlaces.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alamat Anda"),
        actions: [
          IconButton(
            onPressed: _addPlace,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _listOfPlaces.length,
        itemBuilder: ((context, index) {
          return Text(_listOfPlaces[index].name);
        }),
      ),
    );
  }
}
