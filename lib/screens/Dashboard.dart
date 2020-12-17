import 'package:astory/models/Article_Model.dart';
import 'package:astory/models/News_Model.dart';
import 'package:astory/screens/widgets/Category_News_Tile.dart';
import 'package:astory/screens/widgets/Top_News_Tile.dart';
import 'package:astory/services/Api_Service.dart';
import 'package:astory/viewmodels/News_Category_View_Model.dart';
import 'package:astory/viewmodels/News_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var vm = NewsViewModel();
  var vmCategory = NewsCategoryViewModel();
  var vmDelete = NewsCategoryViewModel();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    print(context.read<NewsViewModel>().news.toString());
  }

  @override
  void dispose() {
    super.dispose();
    vm.dispose();
    vmCategory.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   vm = Provider.of<NewsViewModel>(context, listen: true);
  // }

  @override
  Widget build(BuildContext context) {
    vm = Provider.of<NewsViewModel>(context, listen: true);
    vmCategory = Provider.of<NewsCategoryViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Astory',
          style: GoogleFonts.poppins(
              color: Colors.blue, fontSize: 40.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 3.0),
          height: MediaQuery.of(context).size.height * 1.2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Breaking News',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () {
                          vm.clearList();
                          vm.getNewsData();
                          vmCategory.clearList();
                          vmCategory.getNewsCategoryData('general');
                        }),
                    Text(vmCategory.newsCategory.length.toString())
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TopNewsTile(
                      newsImage: vm.news[index].urlToImage,
                      newsTitle: vm.news[index].title,
                      newsDescription: vm.news[index].description,
                      publishDate: vm.news[index].publishedAt,
                      newsSource: vm.news[index].author,
                    );
                  },
                  itemCount: vm.news.length,
                ),
              ),
              Container(
                child: Flexible(
                  child: DefaultTabController(
                      length: 6,
                      child: Builder(builder: (BuildContext context) {
                        final TabController tabController =
                            DefaultTabController.of(context);
                        tabController.addListener(() {
                          if (!tabController.indexIsChanging) {
                            // Your code goes here.
                            // To get index of current tab use tabController.index
                            switch (tabController.index) {
                              case 0:
                                {
                                  vmCategory.getNewsCategoryData('general');
                                   print(vmCategory.newsCategory.length);
                                }
                                break;
                              case 1:
                                {
                                   vmCategory.getNewsCategoryData('technology');
                                   print(vmCategory.newsCategory.length);

                                }
                                break;
                              case 2:
                                {
                                   vmCategory.getNewsCategoryData('sports');
                                }
                                break;
                              case 3:
                                {
                                   vmCategory.getNewsCategoryData('business');
                                }
                                break;
                              case 4:
                                {
                                   vmCategory.getNewsCategoryData('entertainment');
                                }
                                break;
                              case 5:
                                {
                                   vmCategory.getNewsCategoryData('science');
                                }
                                break;
                            }
                          }
                        }
                        );
                        return Scaffold(
                          appBar: PreferredSize(
                            preferredSize: Size.fromHeight(70.0),
                            child: AppBar(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              bottom: TabBar(
                                controller: tabController,
                                isScrollable: true,
                                labelPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                indicatorColor: Colors.blue,
                                indicatorWeight: 1.5,
                                tabs: [
                                  Text('General',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        color: Colors.blue,
                                      )),
                                  Text('Technology',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        color: Colors.blue,
                                      )),
                                  Text('Sports',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        color: Colors.blue,
                                      )),
                                  Text('Business',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        color: Colors.blue,
                                      )),
                                  Text('Entertainment',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        color: Colors.blue,
                                      )),
                                  Text('Science',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18.0,
                                        color: Colors.blue,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          body: TabBarView(
                            children: [
                              ListView.builder(
                                itemBuilder: (context, index) {
                                  return CategoryNewsTile(
                                    newsImage: vmCategory
                                        .newsCategory[index].urlToImage,
                                    newsTitle:
                                        vmCategory.newsCategory[index].title,
                                    newsDate: vmCategory
                                        .newsCategory[index].publishedAt,
                                  );
                                },
                                itemCount: vmCategory.newsCategory.length,
                              ),
                              ListView.builder(
                                itemBuilder: (context, index) {
                                  return CategoryNewsTile(
                                    newsImage: vmCategory
                                        .newsCategory[index].urlToImage,
                                    newsTitle:
                                        vmCategory.newsCategory[index].title,
                                    newsDate: vmCategory
                                        .newsCategory[index].publishedAt,
                                  );
                                },
                                itemCount: vmCategory.newsCategory.length,
                              ),
                              ListView.builder(
                                itemBuilder: (context, index) {
                                  return CategoryNewsTile(
                                    newsImage: vmCategory
                                        .newsCategory[index].urlToImage,
                                    newsTitle:
                                        vmCategory.newsCategory[index].title,
                                    newsDate: vmCategory
                                        .newsCategory[index].publishedAt,
                                  );
                                },
                                itemCount: vmCategory.newsCategory.length,
                              ),
                              ListView.builder(
                                itemBuilder: (context, index) {
                                  return CategoryNewsTile(
                                    newsImage: vmCategory
                                        .newsCategory[index].urlToImage,
                                    newsTitle:
                                        vmCategory.newsCategory[index].title,
                                    newsDate: vmCategory
                                        .newsCategory[index].publishedAt,
                                  );
                                },
                                itemCount: vmCategory.newsCategory.length,
                              ),
                              ListView.builder(
                                itemBuilder: (context, index) {
                                  return CategoryNewsTile(
                                    newsImage: vmCategory
                                        .newsCategory[index].urlToImage,
                                    newsTitle:
                                        vmCategory.newsCategory[index].title,
                                    newsDate: vmCategory
                                        .newsCategory[index].publishedAt,
                                  );
                                },
                                itemCount: vmCategory.newsCategory.length,
                              ),
                              ListView.builder(
                                itemBuilder: (context, index) {
                                  return CategoryNewsTile(
                                    newsImage: vmCategory
                                        .newsCategory[index].urlToImage,
                                    newsTitle:
                                        vmCategory.newsCategory[index].title,
                                    newsDate: vmCategory
                                        .newsCategory[index].publishedAt,
                                  );
                                },
                                itemCount: vmCategory.newsCategory.length,
                              ),
                            ],
                          ),
                        );
                      })),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
