import "package:auto_route/annotations.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod_example/provider/counter_provider.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod 예제"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text("count: $count"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ref.read(counterProvider.notifier).increment();
                    },
                    child: const Icon(Icons.plus_one),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(counterProvider.notifier).decrement();
                    },
                    child: const Icon(Icons.exposure_minus_1),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
