import 'package:flutter/material.dart';
import 'package:app/src/colors.dart';

class FontSystem {
  static const TextStyle title = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static const TextStyle buttonBold = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle buttonLight = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFF626262),
  );

  static const TextStyle caption = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Color(0xFF626262),
  );
}
