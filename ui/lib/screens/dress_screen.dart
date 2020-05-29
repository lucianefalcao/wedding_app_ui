import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wedding_app_ui/constants.dart';
import 'package:wedding_app_ui/models/dress_model.dart';
import 'package:wedding_app_ui/screens/home_screen.dart';
import 'package:wedding_app_ui/widgets/build_stars.dart';

class DressScreen extends StatefulWidget {
  final Dress dress;

  const DressScreen({this.dress});

  @override
  _DressScreenState createState() => _DressScreenState();
}

class _DressScreenState extends State<DressScreen> {
  int _currentSelect = -1;
  bool isSelected = false;

  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.dress.description.length > 150) {
      firstHalf = widget.dress.description.substring(0, 150);
      secondHalf = widget.dress.description
          .substring(0, widget.dress.description.length);
    } else {
      firstHalf = widget.dress.description;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 600.0,
            width: double.infinity,
            child: ClipRRect(
              child: Image(
                image: AssetImage(widget.dress.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 600.0,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
            padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Text(
                  widget.dress.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    BuildStars(rating: widget.dress.rating),
                    Container(
                      height: 55.0,
                      width: 55.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kAccentColor,
                      ),
                      child: IconButton(
                        icon: widget.dress.isMarked
                            ? Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 24.0,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 24.0,
                              ),
                        onPressed: () {
                          setState(() {
                            widget.dress.isMarked = !widget.dress.isMarked;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$ ${widget.dress.price}",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Detail Products",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  child: secondHalf.isEmpty
                      ? Text(widget.dress.description)
                      : RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            text: flag ? firstHalf : (firstHalf + secondHalf),
                            style: TextStyle(
                                color: kSecondaryColor, fontSize: 15.0),
                            children: <TextSpan>[
                              TextSpan(
                                  text: flag ? "Read More" : " Read Less",
                                  style: TextStyle(
                                    color: kAccentColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        flag = !flag;
                                      });
                                    }),
                            ],
                          ),
                        ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Sizing",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  height: 40.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _sizeChoice("S", 0),
                      _container(),
                      _sizeChoice("M", 1),
                      _container(),
                      _sizeChoice("L", 2),
                      _container(),
                      _sizeChoice("XL", 3),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: kSecondaryColor),
                      ),
                      child: Icon(
                        Icons.phone,
                        color: kSecondaryColor,
                      ),
                    ),
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: kSecondaryColor),
                      ),
                      child: Icon(
                        Icons.comment,
                        color: kSecondaryColor,
                      ),
                    ),
                    Container(
                      width: 240.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: kAccentColor,
                      ),
                      child: Center(
                        child: Text(
                          "Make an Appointment",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _sizeChoice(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected && _currentSelect == index) {
            _currentSelect = -1;
            isSelected = false;
          } else {
            _currentSelect = index;
            isSelected = true;
          }
        });
      },
      child: Container(
        width: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentSelect == index ? kAccentColor : kSizingButtonColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              color: _currentSelect == index ? Colors.white : kSecondaryColor,
            ),
          ),
        ),
      ),
    );
  }

  _container() {
    return Container(
      width: 40.0,
      height: 6.0,
      color: kSizingButtonColor,
    );
  }
}

