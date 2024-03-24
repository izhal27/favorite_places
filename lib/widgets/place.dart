import 'package:favorite_places/widgets/detail_place.dart';
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

  void _showDetail(Place item) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DetailPlace(place: item)),
    );
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        child: ListView.builder(
          itemCount: _listOfPlaces.length,
          itemBuilder: ((context, index) {
            final item = _listOfPlaces[index];
            return ListTile(
              onTap: () => _showDetail(item),
              title: Text(
                item.name,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }),
        ),
      ),
    );
  }
}
