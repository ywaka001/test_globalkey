import 'package:banana/test_globalkey/widget/btn_widget2.dart';
import 'package:flutter/material.dart';
import 'package:banana/test_globalkey/main.dart';
import 'package:banana/test_globalkey/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BasicKeyPage extends StatelessWidget {
  final keyCounter = GlobalKey<_CounterWidgetState>();

  _testData(int a, int b) {
    return a + b;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: CounterWidget(key: keyCounter),
          //     Column(
          //       children: [
          //         CounterWidget(key: keyCounter),
          //         Btn2Widget(text: 'Demo', onClicked: _testData(5, 15)),
          //   ],
          // )
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final counter = keyCounter.currentState!.counter;

            keyCounter.currentState!.increment(10, 5);
            final newCounter = keyCounter.currentState!.counter;

            Utils.showSnackBar(context,
                text: 'Counter: $counter -> $newCounter');
          },
        ),
      );
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  void increment(int a, int b) => setState(() => counter += a + b);

  @override
  Widget build(BuildContext context) => Text(
        'Counter: $counter',
        style: TextStyle(fontSize: 32),
      );
}
