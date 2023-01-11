import 'package:flutter/material.dart';
import 'counter_bloc.dart';
import 'counter_bloc2.dart';
import 'content_provider.dart';

class Counter extends StatefulWidget {
  Counter({Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    bloc2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: bloc.getCount, // menghitung jumlah bloc
      initialData: CounterProvider().count, // menghitung jumlah counter provider
      builder: (context, snapshot) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You have pushed the button this many times'),
              Text('${snapshot.data}',
                style: Theme.of(context).textTheme.display1,
              ), // menampilkan data counter
            ],
          ),
        );
      },
    );
  }
}