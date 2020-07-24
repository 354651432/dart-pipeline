# dart-pipeline
dart lib to solve flutter ui callback hell

## dart row style
```dart
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
```

## after pipeline functional style
```dart
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
```

## after pipeline classal style
```dart
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
```
