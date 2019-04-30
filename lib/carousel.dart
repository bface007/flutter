import 'package:deneme_app/page.dart';
import 'package:deneme_app/page_data.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final PageData pageData;
  const Carousel({Key key, this.pageData}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<EdgeInsets> animation;
  bool firstCreate = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    animation =
        Tween<EdgeInsets>(begin: EdgeInsets.all(30), end: EdgeInsets.all(0))
            .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    setState(() {
      firstCreate = true;
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => _build(),
    );
  }

  _build() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => Page(pageData: widget.pageData),
            ),
          );
        },
        child: Container(
          height: double.infinity,
          margin: animation.value,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: "de",
                  child: Image.asset(
                    widget.pageData.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0, left: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Hero(
                    tag: "hero2",
                    child: Container(
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Material(
                            color: Colors.transparent,
                            child: Text(
                              widget.pageData.publishedDate,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: Text(
                              widget.pageData.title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
