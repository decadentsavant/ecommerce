import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> openIconSnackBar(
  BuildContext context,
  String text,
  Widget icon,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content: Row(
        children: [
          icon,
          const SizedBox(
            width: 5,
          ),
          Text(text)
        ],
      ),
      duration: const Duration(milliseconds: 2500),
    ),
  );
}
