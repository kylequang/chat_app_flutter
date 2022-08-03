import 'package:flutter/material.dart';

Widget emptyData(String url, {String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(url, fit: BoxFit.contain),
      const SizedBox(
        height: 20,
      ),
      Text(
        title ?? '',
        style: const TextStyle(fontSize: 16),
      ),
    ],
  );
}
