import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdio/com/kukugtu/rxdio/rxdio.dart';

import 'controller/pagecontroller/main_controller.dart';

void main() {
  RxDio.initDatabase();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MainPresenter mainPresenter = new MainPresenter();

  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String rpList = "";

  @override
  void initState() {
    StreamController<int> addNumStreamController = new StreamController<int>();

    Observable(addNumStreamController.stream).listen((count) {
      setState(() {
        _counter = count;
      });
    });
    widget.mainPresenter.setAddNumCOntroller(addNumStreamController);

    StreamController<String> listRedPackageStreamController =
        new StreamController<String>();
    Observable(listRedPackageStreamController.stream).listen((rpList) {
      setState(() {
        this.rpList = rpList;
      });
    });
    widget.mainPresenter
        .setListRedpackageController(listRedPackageStreamController);
  }

  void _addCounter() {
    widget.mainPresenter.addNumController.addCounter();
  }

  void _reducetCounter() {
    widget.mainPresenter.addNumController.reduceCounter();
  }

  void _getRedpackageList() {
    widget.mainPresenter.listRedpackageController.getRedPackage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("RxState"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new Text(
              rpList,
              maxLines: 20,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      floatingActionButton: new Container(
        height: 200,
        alignment: Alignment.topRight,
        child: new Column(
          children: <Widget>[
            FloatingActionButton(
              onPressed: _getRedpackageList,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: _addCounter,
              tooltip: 'Increment',
              child: Icon(Icons.exposure_plus_1),
            ),
            FloatingActionButton(
              onPressed: _reducetCounter,
              tooltip: 'Increment',
              child: Icon(Icons.exposure_neg_1),
            ),
          ],
        ),
      ),
    );
  }
}
