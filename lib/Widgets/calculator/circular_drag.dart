import 'package:flutter/material.dart';
import 'package:circular/circular.dart';

class CircularSlide extends StatefulWidget {
  const CircularSlide({super.key, required this.setValue});

  final Function(double) setValue;

  @override
  State<CircularSlide> createState() => _CircularSlideState();
}

class _CircularSlideState extends State<CircularSlide> {
  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    return CircularSlider(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          boxShadow: const [
            BoxShadow(
                offset: Offset(-1, -1),
                color: Colors.white,
                blurRadius: 20,
                spreadRadius: 1),
            BoxShadow(
                offset: Offset(1, 1),
                color: Color.fromARGB(255, 158, 158, 158),
                blurRadius: 2,
                spreadRadius: 1)
          ]),
      maxValue: 100,
      radius: 80,
      child: Text(
        value.toString(),
        style: const TextStyle(fontSize: 30),
      ),
      color: const Color.fromARGB(255, 255, 251, 251),
      sliderColor: const Color.fromARGB(255, 134, 239, 255),
      unSelectedColor: const Color.fromARGB(255, 232, 242, 255),
      onDrag: (value) {
        widget.setValue(value.toDouble());
        setState(() {
          this.value = value.toDouble();
        });
      },
    );
  }
}
