import 'package:flutter/material.dart';
import 'pipeLine.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  Widget rawBuild() {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            "Helllo World",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }

  Widget functionalPipeLineBuild() {
    return pipeLine(
        Text(
          "Hello World",
          style: Theme.of(context).textTheme.headline4,
        ),
        [
          (child) => Center(child: child),
          (child) => Scaffold(body: child),
          (child) => MaterialApp(home: child),
        ]);
  }

  Widget classalPipeLineBuild() {
    return PipeLine<Widget>(Text(
      "Hello World",
      style: Theme.of(context).textTheme.headline4,
    ))
        .via((child) => Center(child: child))
        .via((child) => Scaffold(body: child))
        .via((child) => MaterialApp(home: child))
        .build();
  }

  @override
  Widget build(BuildContext context) {
    // return rawBuild();
    // return functionalPipeLineBuild();
    return classalPipeLineBuild();
  }
}

void main() => runApp(Todo());
