import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    this.text = 'No products yet',
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Lottie.asset('assets/anim/empty.json', width: 200, repeat: false),
        ],
      ),
    );
  }
}
