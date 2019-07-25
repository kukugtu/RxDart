import 'dart:async';

import 'package:flutter/material.dart';

abstract class BaseController<T> {
  StreamController<T> controller;

  BaseController(controller) {
    this.controller = controller;
  }

}
