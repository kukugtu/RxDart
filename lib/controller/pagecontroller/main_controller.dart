import 'dart:async';

import 'package:rxstate/controller/simplecontroller/add_num_controller.dart';
import 'package:rxstate/controller/simplecontroller/list_redpackage_controller.dart';

class MainPresenter {
  AddNumController addNumController;
  ListRedpackageController listRedpackageController;

  void setAddNumCOntroller(StreamController addNumStreamController) {
    addNumController = new AddNumController(addNumStreamController);
  }

  void setListRedpackageController(
      StreamController listRedpackageStreamController) {
    listRedpackageController =
        new ListRedpackageController(listRedpackageStreamController);
  }
}
