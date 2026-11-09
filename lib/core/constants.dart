
import 'package:flutter/material.dart';

// Design tokens
const Color backgroundColor = Color(0xFF080808);
const Color surfaceColor = Color(0xFF151515);
const Color goldColor = Color(0xFFD6B46A);
const Color lightGoldColor = Color(0xFFF2D99A);
const Color bronzeColor = Color(0xFF8A5A2B);
const Color heartColor = Color(0xFFFF5A6E);

// Typography
const TextStyle largeTitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 34,
  fontWeight: FontWeight.w800,
  letterSpacing: -0.9,
  height: 1.1,
);

// Rupiah formatter
String formatRupiah(int value) {
  final s = value.toString();
  final buf = StringBuffer();

  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) {
      buf.write('.');
    }

    buf.write(s[i]);
  }

  return 'Rp$buf';
}
