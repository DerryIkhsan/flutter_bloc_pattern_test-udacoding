import 'dart:async';
import 'content_provider.dart';

class CounterBloc {
  final StreamController counterController = StreamController<dynamic>(); // membuat sebuah stream controller
  final CounterProvider provider = CounterProvider(); // membuat sebuah counter provider
  Stream get getCount => counterController.stream;

  void updateCount(){
    provider.increaseCount();
    counterController.sink.add(provider.count); // menambahkan provider ke dalam counter controller
  }

  void dispose(){
    counterController.close(); // menutup counter controller ketika tidak digunakan
  }
}

final bloc = CounterBloc(); // menjadikan class counter bloc sebagai sebuah object agar digunakan pada class lain