import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/models/place.dart';

class PlaceStateNotifier extends StateNotifier<List<Place>> {
  PlaceStateNotifier() : super(const []);

  addPlace(Place item) {
    state = [item, ...state];
  }
}

final placeProvider =
    StateNotifierProvider<PlaceStateNotifier, List<Place>>((ref) {
  return PlaceStateNotifier();
});
