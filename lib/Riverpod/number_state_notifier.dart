import 'package:flutter_riverpod/all.dart';

class NumberStateNotifier extends StateNotifier<List<int>> {
  NumberStateNotifier() : super([]);

  int counter = 0;

  void add(int number) {
    state = [...state, number];
  }

  void remove(int number) {
    state = [
      for (final loopNumber in state)
        if (number != loopNumber) loopNumber,
    ];
  }
}
