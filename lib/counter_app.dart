import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void restart() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter APP")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Counter:",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingButonsRow(
        increaseFn: increase,
        decreaseFn: decrease,
        restartFn: restart,
      ),
    );
  }
}

class FloatingButonsRow extends StatelessWidget {
  final Function increaseFn;
  final Function restartFn;
  final Function decreaseFn;

  const FloatingButonsRow({
    Key? key,
    required this.increaseFn,
    required this.restartFn,
    required this.decreaseFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => increaseFn(),
          child: const Icon(Icons.plus_one),
        ),
        FloatingActionButton(
          onPressed: () => restartFn(),
          child: const Icon(Icons.exposure_outlined),
        ),
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          child: const Icon(Icons.exposure_minus_1),
        ),
      ],
    );
  }
}
