import 'dart:ui';
import 'package:astory/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class TopNewsTile extends StatefulWidget {
  final String newsImage, newsTitle, newsDescription, publishDate, newsSource;
  TopNewsTile(
      {this.newsImage,
      this.newsTitle,
      this.newsDescription,
      this.publishDate,
      this.newsSource});

  @override
  _TopNewsTileState createState() => _TopNewsTileState();
}

class _TopNewsTileState extends State<TopNewsTile> {
  @override
  Widget build(BuildContext context) {
    var getDate = widget.publishDate;
    String formattedDate = getDate.substring(0, getDate.indexOf('T'));

    return Container(
      width: 400.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                height: MediaQuery.of(context).size.height / 2,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.newsImage != null ? widget.newsImage : Constants().IMAGE_UNAVAILABLE),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Positioned(
                top: Platform.isIOS ? 200.0 : 170.0,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      margin: Platform.isIOS ? EdgeInsets.only(left: 20.0, right: 20.0) : EdgeInsets.only(left: 20.0, right: 12.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 35.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0), ),
                          color: Colors.grey.shade900.withOpacity(0.5)),
                      child: Column(
                        children: [
                          Text(
                            widget.newsTitle != null ? widget.newsTitle : "TITLE UNAVAILABLE",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            widget.newsDescription != null ? widget.newsDescription : "DESC UNAVAILABLE",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          SizedBox(height: 15.0),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  formattedDate != null ? formattedDate : "DATE UNAVAILABLE",
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.white),
                                ),
                                Text(
                                  widget.newsSource != null
                                      ? widget.newsSource
                                      : "SOURCE UNAVAILABLE",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
