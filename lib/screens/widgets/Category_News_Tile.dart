import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryNewsTile extends StatefulWidget {
  final String newsImage;
  final String newsTitle;
  final String newsDate;

  CategoryNewsTile({this.newsImage, this.newsTitle, this.newsDate});

  @override
  _CategoryNewsTileState createState() => _CategoryNewsTileState();
}

class _CategoryNewsTileState extends State<CategoryNewsTile> {
  @override
  Widget build(BuildContext context) {
    var getDate = widget.newsDate;
    String formattedDate = getDate.substring(0, getDate.indexOf('T'));

    return Container(
        height: 80.0,
        child: Row(
          children: [
            Container(
              width: 70.0,
              height: 70.0,
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
              child: Image.network(widget.newsImage),
            ),
            Flexible(
              child: Container(
                  child: Text(
                widget.newsTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(),
              )),
            ),
            Text(formattedDate),
          ],
        ));
  }
}
