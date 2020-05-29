import 'package:flutter/material.dart';
import 'package:wedding_app_ui/constants.dart';
import 'package:wedding_app_ui/models/dress_model.dart';
import 'package:wedding_app_ui/screens/dress_screen.dart';
import 'package:wedding_app_ui/widgets/build_stars.dart';

class RecommendedList extends StatefulWidget {
  @override
  _RecommendedListState createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: recommendList.length,
      itemBuilder: (BuildContext context, int index) {
        Dress dress = recommendList[index];
        return Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DressScreen(dress: dress)),
                );
              },
              child: Container(
                height: 120.0,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.fromLTRB(7.0, 7.0, 20.0, 7.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(dress.image),
                        height: 110.0,
                        width: 100.0,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          dress.title,
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Row(
                          children: <Widget>[
                            BuildStars(rating: dress.rating),
                            SizedBox(width: 100.0),
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
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

