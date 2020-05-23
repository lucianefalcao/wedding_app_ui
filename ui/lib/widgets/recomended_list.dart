import 'package:flutter/material.dart';
import 'package:ui/constants.dart';
import 'package:ui/models/dress_model.dart';
import 'package:ui/widgets/build_stars.dart';

class RecomendedList extends StatefulWidget {
  @override
  _RecomendedListState createState() => _RecomendedListState();
}

class _RecomendedListState extends State<RecomendedList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: recommendList.length,
      itemBuilder: (BuildContext context, int index) {
        Dress dress = recommendList[index];
        return Stack(
          children: <Widget>[
            Container(
              height: 120.0,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20.0),
              padding: EdgeInsets.only(
                  top: 7.0, left: 7.0, bottom: 7.0, right: 20.0),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Wedding Dress",
                        style: TextStyle(fontSize: 19.0),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          BuildStars(rating: dress.rating),
                          SizedBox(width: 100.0),
                          Container(
                            height: 35.0,
                            width: 35.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: color3,
                            ),
                            child: IconButton(
                              icon: dress.isMarked
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: 20.0,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 20.0,
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
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
