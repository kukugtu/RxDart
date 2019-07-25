import 'dart:async';

import 'package:rxstate/controller/base/base_controller.dart';


class AddNumController extends BaseController<int> {
  int _counter = 0;

  AddNumController(controller) : super(controller);

  void addCounter() {
    _counter++;
    controller.add(_counter);
  }

  void reduceCounter() {
    _counter--;
    controller.add(_counter);
  }
}
