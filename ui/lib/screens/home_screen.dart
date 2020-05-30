import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:ui/constants.dart';
import 'package:ui/widgets/dress_carousel.dart';
import 'package:ui/widgets/recommend_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PreloadPageController _pageController;
  int _currentTab = 0;

  @override
  void initState() {
    super.initState();
    _pageController =
        PreloadPageController(initialPage: 0, viewportFraction: 0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0,
        unselectedItemColor: Colors.grey[350],
        selectedItemColor: kAccentColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: _currentTab == 0
                ? Container(
                    width: 10.0,
                    height: 2.5,
                    color: kAccentColor,
                  )
                : Container(
                    width: 100.0,
                    height: 2.5,
                  ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: _currentTab == 1
                ? Container(
                    width: 10.0,
                    height: 2.5,
                    color: kAccentColor,
                  )
                : Container(
                    width: 100.0,
                    height: 2.5,
                  ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: _currentTab == 2
                ? Container(
                    width: 10.0,
                    height: 2.5,
                    color: kAccentColor,
                  )
                : Container(
                    width: 100.0,
                    height: 2.5,
                  ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: _currentTab == 3
                ? Container(
                    width: 10.0,
                    height: 2.5,
                    color: kAccentColor,
                  )
                : Container(
                    width: 100.0,
                    height: 2.5,
                  ),
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 30.0),
            child: Text(
              "Hi, Angela",
              style: TextStyle(
                color: kSecondaryColor,
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 4.0, bottom: 40.0),
            child: Text(
              "Let's Shopping Now",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 30.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Here...",
                      prefixIcon: Icon(Icons.search, size: 30.0),
                      fillColor: Colors.grey[200],
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20.0),
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: kAccentColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Icon(
                  Ionicons.ios_options,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 40.0, bottom: 30.0),
            child: Text(
              "Popular",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DressCarousel(pageController: _pageController),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.only(left: 20.0, top: 25.0, right: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: Colors.grey[200],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Recommended",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                RecommendedList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

