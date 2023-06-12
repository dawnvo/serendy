import 'package:flutter/material.dart';

const kContentPadding = Sizes.p12;
const kBorderRadius = Sizes.p8;

abstract final class Sizes {
  static const double zero = 0.0;
  static const double p4 = 4.0;
  static const double p8 = 8.0;
  static const double p12 = 12.0;
  static const double p16 = 16.0;
  static const double p20 = 20.0;
  static const double p24 = 24.0;
  static const double p28 = 28.0;
  static const double p32 = 32.0;
  static const double p40 = 40.0;
  static const double p48 = 48.0;
  static const double p64 = 64.0;
}

abstract final class Gap {
  // widths
  static const w4 = SizedBox(width: Sizes.p4);
  static const w8 = SizedBox(width: Sizes.p8);
  static const w12 = SizedBox(width: Sizes.p12);
  static const w16 = SizedBox(width: Sizes.p16);
  static const w20 = SizedBox(width: Sizes.p20);
  static const w24 = SizedBox(width: Sizes.p24);
  static const w32 = SizedBox(width: Sizes.p32);
  static const w40 = SizedBox(width: Sizes.p40);
  static const w48 = SizedBox(width: Sizes.p48);
  static const w64 = SizedBox(width: Sizes.p64);

  // heights
  static const h4 = SizedBox(height: Sizes.p4);
  static const h8 = SizedBox(height: Sizes.p8);
  static const h12 = SizedBox(height: Sizes.p12);
  static const h16 = SizedBox(height: Sizes.p16);
  static const h20 = SizedBox(height: Sizes.p20);
  static const h24 = SizedBox(height: Sizes.p24);
  static const h32 = SizedBox(height: Sizes.p32);
  static const h40 = SizedBox(height: Sizes.p40);
  static const h48 = SizedBox(height: Sizes.p48);
  static const h64 = SizedBox(height: Sizes.p64);
}
