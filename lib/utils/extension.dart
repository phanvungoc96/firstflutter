import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

extension Ex on double {
  double asFixed(int n) => double.parse(toStringAsFixed(n));
}

extension TextExt on Text {
  //16
  Text title(Color color, {int? line}) {
    return line == null
        ? Text(data.toString(), style: GoogleFonts.lato(color: color, fontSize: 16))
        : Text(
            data.toString(),
            style: GoogleFonts.lato(color: color, fontSize: 16),
            maxLines: line,
            overflow: TextOverflow.ellipsis,
          );
  }

  //14
  Text medium(Color color) {
    return Text(data.toString(), style: GoogleFonts.lato(color: color, fontSize: 14));
  }

  Text mediumLong(Color color, int? line) {
    return Text(
      data.toString(),
      overflow: TextOverflow.ellipsis,
      maxLines: line,
      style: GoogleFonts.lato(color: color, fontSize: 14),
    );
  }

  Text bold(Color color) {
    return Text(data.toString(), style: GoogleFonts.lato(color: color, fontSize: 14, fontWeight: FontWeight.bold));
  }

  Align mediumCenterLeft(Color color) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(data.toString(), style: GoogleFonts.lato(color: color, fontSize: 14)));
  }

  //12
  Text small(Color color) {
    return Text(data.toString(), style: GoogleFonts.lato(color: color, fontSize: 12));
  }

  Align smallCenterLeft(Color color) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(data.toString(), style: GoogleFonts.lato(color: color, fontSize: 12)));
  }
}
