import 'package:flutter/material.dart';
import 'package:flutter_challengues/Riverpod/number_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = Provider<int>((ref) {
  return 42;
});

final stateNumberProvider = StateProvider<int>((ref) {
  return 42;
});

final numbersNotifierProvider =
    StateNotifierProvider<NumberStateNotifier>((ref) {
  return NumberStateNotifier();
});

class SMwithRiverPod extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // final number = watch(numberProvider);
    // final numberState = watch(stateNumberProvider);
    final numberNotifierState = watch(numbersNotifierProvider.state);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RiverPod',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever_outlined),
            onPressed: () => context
                .read(numbersNotifierProvider)
                .remove(numberNotifierState.last),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: numberNotifierState.length,
            itemBuilder: (context, index) {
              return Text(numberNotifierState[index].toString());
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () => context.read(numbersNotifierProvider).add(4),
      ),
    );
  }

  void increment(BuildContext context) {
    context.read(stateNumberProvider).state++;
  }
}
