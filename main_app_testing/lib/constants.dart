import 'package:flutter/material.dart';

const kSecondaryColor = Color(0xFF8B94BC);
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

class Constants {
  static const regularHeading = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black);

  static const boldHeading = TextStyle(
      fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.black);

  static const regularDarkText = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black);
}

const double kDefaultPadding = 20.0;
