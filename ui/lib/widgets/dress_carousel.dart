import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:wedding_app_ui/constants.dart';
import 'package:wedding_app_ui/models/dress_model.dart';
import 'package:wedding_app_ui/screens/dress_screen.dart';
import 'package:wedding_app_ui/widgets/build_stars.dart';

class DressCarousel extends StatefulWidget {
  final PreloadPageController pageController;

  const DressCarousel({this.pageController});

  @override
  _DressCarouselState createState() => _DressCarouselState();
}

class _DressCarouselState extends State<DressCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: PreloadPageView.builder(
        physics: BouncingScrollPhysics(),
        preloadPagesCount: 3,
        controller: widget.pageController,
        itemCount: popularList.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildPost(context, index);
        },
      ),
    );
  }

  _buildPost(BuildContext context, int index) {
    Dress dress = popularList[index];
    return AnimatedBuilder(
      animation: widget.pageController,
      builder: (BuildContext context, Widget w) {
        double value = 1;
        if (widget.pageController.position.haveDimensions) {
          value = widget.pageController.page - index;
          value = (1 - (value.abs() * 0.35)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 400.0,
            child: w,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DressScreen(dress: dress)),
          );
        },
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: 400.0,
                  width: 300.0,
                  image: AssetImage(dress.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3),
                  ],
                  stops: [0.1, 0.4, 0.6, 0.9],
                ),
              ),
            ),
            Positioned(
              bottom: 30.0,
              left: 30.0,
              right: 30.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    dress.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      BuildStars(rating: dress.rating),
                      Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kAccentColor,
                        ),
                        child: IconButton(
                          icon: dress.isMarked
                              ? Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 22.0,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 22.0,
                                ),
                          onPressed: () {
                            setState(() {
                              dress.isMarked = !dress.isMarked;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "\$ ${dress.price}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

