import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarText extends StatefulWidget {

  final String tabTitle;
  TabBarText({this.tabTitle});

  @override
  _TabBarTextState createState() => _TabBarTextState();
}

class _TabBarTextState extends State<TabBarText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.tabTitle,
        style: GoogleFonts.poppins(
          fontSize: 18.0,
          color: Colors.blue,
        ));
  }
}
