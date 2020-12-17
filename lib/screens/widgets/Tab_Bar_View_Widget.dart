import 'package:astory/viewmodels/News_Category_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'Category_News_Tile.dart';

class TabBarViewItem extends StatefulWidget {
  @override
  _TabBarViewItemState createState() => _TabBarViewItemState();
}

class _TabBarViewItemState extends State<TabBarViewItem> {

  var vmCategory = NewsCategoryViewModel();

  @override
  Widget build(BuildContext context) {

    vmCategory = Provider.of<NewsCategoryViewModel>(context, listen: true);
    return ListView.builder(
      itemBuilder: (context, index) {
        return CategoryNewsTile(
          newsImage: vmCategory.newsCategory[index].urlToImage,
          newsTitle: vmCategory.newsCategory[index].title,
          newsDate: vmCategory.newsCategory[index].publishedAt,
        );
      },
      itemCount: vmCategory.newsCategory.length,
    );
  }
}
