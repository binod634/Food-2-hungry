import 'package:flutter/material.dart';

GestureDetector returnGesture() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
      ),
      child: const Icon(
        Icons.camera_alt,
        size: 60,
        color: Colors.grey,
      ),
    ),
  );
}
