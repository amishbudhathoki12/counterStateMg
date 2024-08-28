import 'package:coutner_state/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final counterText = ref.watch(counterProvider);
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              child: const Icon(Icons.minimize),
            ),
            FloatingActionButton(
              onPressed: () {
                // setState(() {
                //   counterText = counterText + 1;
                // });
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                const Text("You have pushed the button this many times"),
                Text(
                  counterText.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
