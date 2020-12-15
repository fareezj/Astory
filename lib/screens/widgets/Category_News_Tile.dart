import 'package:flutter/material.dart';

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
    return Container(
      height: 100.0,
        child: Row(
      children: [
        Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
          child: Image.network(widget.newsImage),
        ),
        Text(widget.newsTitle),
        Text(widget.newsDate),
      ],
    ));
  }
}
