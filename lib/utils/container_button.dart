import 'package:flutter/material.dart';

GestureDetector containerButton(
    {double? width,
    double? height,
    String? text,
    Color? color,
    void Function()? onpress}) {
  return GestureDetector(
    onTap: onpress ?? () {},
    child: Container(
      width: width! * 0.25,
      height: height! * 0.125,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(18)),
      ),
      child: Center(
        child: Text(
          text ?? "",
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    ),
  );
}
