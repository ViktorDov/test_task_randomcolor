import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Clickable Grid'),
        ),
        body: ClickableGrid(),
      ),
    );
  }
}

class ClickableGrid extends StatefulWidget {
  const ClickableGrid({super.key});

  @override
  _ClickableGridState createState() => _ClickableGridState();
}

class _ClickableGridState extends State<ClickableGrid> {
  final List<Color> _colors =
      List.generate(12, (index) => _generateRandomColor());
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
              _updateColors();
            });
          },
          child: Container(
            color: _selectedIndex == index ? Colors.grey : _colors[index],
            margin: const EdgeInsets.all(4.0),
          ),
        );
      },
    );
  }

  void _updateColors() {
    for (int i = 0; i < _colors.length; i++) {
      if (i != _selectedIndex) {
        _colors[i] = _generateRandomColor();
      }
    }
  }

  static Color _generateRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }
}
