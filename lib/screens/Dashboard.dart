import 'package:astory/screens/widgets/Category_News_Tile.dart';
import 'package:astory/screens/widgets/Tab_Bar_View_Widget.dart';
import 'package:astory/screens/widgets/Tab_Bar_Widget.dart';
import 'package:astory/screens/widgets/Top_News_Tile.dart';
import 'package:astory/viewmodels/News_Category_View_Model.dart';
import 'package:astory/viewmodels/News_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  var vm = NewsViewModel();
  var nvm = NewsViewModel();
  var vmCategory = NewsCategoryViewModel();
  var vmDelete = NewsCategoryViewModel();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    print(context.read<NewsViewModel>().news.toString());

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      vm = Provider.of<NewsViewModel>(context, listen: false);
      vmCategory = Provider.of<NewsCategoryViewModel>(context, listen: false);
      vmCategory.getNewsCategoryData('general');
      vm.getNewsData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    vm.dispose();
    vmCategory.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(vm.news.length > 0 && vmCategory.newsCategory.length > 0) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    vm = Provider.of<NewsViewModel>(context, listen: true);

    return LoadingOverlay(
      isLoading: _isLoading,
      opacity: 1,
      color: Colors.white,
      progressIndicator: Lottie.asset('assets/paperplane.json'),
      child: Scaffold(
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
                                  }
                                  break;
                                case 1:
                                  {
                                    vmCategory.getNewsCategoryData('technology');
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
                                    vmCategory
                                        .getNewsCategoryData('entertainment');
                                  }
                                  break;
                                case 5:
                                  {
                                    vmCategory.getNewsCategoryData('science');
                                  }
                                  break;
                              }
                            }else {
                              vmCategory.clearList();
                            }
                          });
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
                                    TabBarText(tabTitle: 'General'),
                                    TabBarText(tabTitle: 'Technology'),
                                    TabBarText(tabTitle: 'Sports'),
                                    TabBarText(tabTitle: 'Business'),
                                    TabBarText(tabTitle: 'Entertainment'),
                                    TabBarText(tabTitle: 'Science'),
                                  ],
                                ),
                              ),
                            ),
                            body: TabBarView(
                              children: [
                                TabBarViewItem(),
                                TabBarViewItem(),
                                TabBarViewItem(),
                                TabBarViewItem(),
                                TabBarViewItem(),
                                TabBarViewItem(),
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
      ),
    );
  }
}
