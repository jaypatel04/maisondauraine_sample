import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({Key? key}) : super(key: key);

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  bool _bigger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animation',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: AnimatedContainer(
              width: _bigger ? 100 : 500,
              child: Image.asset('assets/images/nature.jpg'),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutQuint,
            ),
          ),
          ElevatedButton(
            onPressed: () => setState(
              () {
                _bigger = !_bigger;
              },
            ),
            child: const Icon(Icons.animation),
          ),
        ],
      ),
    );
  }
}
