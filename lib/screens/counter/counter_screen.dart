import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;

  String textCounter() {
    return clickCounter != 1 ? 'Clicks' : 'Click';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Screen'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter',
                  style: const TextStyle(
                      fontSize: 160, fontWeight: FontWeight.w100)),
              Text(textCounter(), style: const TextStyle(fontSize: 25))
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
                icon: Icons.refresh_rounded,
                onPressed: () {
                  setState(() {
                    clickCounter = 0;
                  });
                }),
            const SizedBox(height: 15),
            CustomButton(
                icon: Icons.plus_one,
                onPressed: () {
                  setState(() {
                    clickCounter++;
                  });
                }),
            const SizedBox(height: 15),
            CustomButton(
                icon: Icons.exposure_minus_1_outlined,
                onPressed: () {
                  setState(() {
                    if (clickCounter == 0) return;
                    clickCounter--;
                  });
                }),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
