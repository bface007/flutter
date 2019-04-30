import 'package:deneme_app/page_data.dart';
import 'package:flutter/material.dart';

class Page extends StatefulWidget {
  final PageData pageData;
  const Page({Key key, this.pageData}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> fontSizeAnimation;
  Animation<double> descPadding;
  Animation<double> descOpacity;
  Animation<double> starScale;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    fontSizeAnimation = Tween<double>(begin: 18, end: 25).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    descOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.65, curve: Curves.easeIn),
      ),
    );
    descPadding = Tween<double>(begin: 20, end: 5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 0.4, curve: Curves.easeIn),
      ),
    );
    starScale = Tween<double>(begin: 10, end: 25).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.2, 0.6, curve: Curves.bounceOut),
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => _build(),
      ),
    );
  }

  _build() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          widget.pageData.image,
          fit: BoxFit.cover,
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 320,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/beyaz1111.png"),
                  fit: BoxFit.cover,
                )),
                height: 520,
                child: Hero(
                  tag: "hero2",
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, left: 20.0),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Material(
                            color: Colors.transparent,
                            child: Text(
                              widget.pageData.publishedDate,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 8),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: Text(
                              widget.pageData.title,
                              style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Visibility(
                            visible: descOpacity.value > 0.2 ? true : false,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _publishedDateTime(),
                                _movieDescription(),
                                Opacity(
                                  opacity: descOpacity.value,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 50, bottom: 12),
                                    child: Text(
                                      "Cast",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15, fontFamily: "Montserrat-Bold"),
                                    ),
                                  ),
                                ),
                                _castList(),
                                _movieInfo()
                              ],
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
        Padding(
          padding: EdgeInsets.only(top: 25.0, left: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ],
    );
  }

  Opacity _movieInfo() {
    return Opacity(
      opacity: descOpacity.value,
      child: Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Director",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "J.J. Abrams",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Writers",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Rian Johnson, George Lucas",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Producers",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "J.J. Abrams",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Opacity _castList() {
    List<Cast> casts = widget.pageData.cast;
    return Opacity(
      opacity: descOpacity.value,
      child: Container(
        width: double.infinity,
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: casts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage(casts[index].image),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      casts[index].name,
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Opacity _movieDescription() {
    return Opacity(
      opacity: descOpacity.value,
      child: Text(
        "Id usu delenit gubergren, his cu malorum detraxit. Quis scripta an eum, dico summo laboramus et nec. Enim dicta nostro vix eu, nulla feugiat insolens mel an, ei sed dolore populo. Eam ex summo utroque constituto, id diam ponderum nam. Nam meis modus oratio et. Ius adhuc forensibus cu, an summo nonumy singulis est.",
        style: TextStyle(
            color: Colors.grey.shade900.withOpacity(0.9), fontSize: 10, fontFamily: "Montserrat-Bold"),
      ),
    );
  }

  Opacity _publishedDateTime() {
    return Opacity(
      opacity: descOpacity.value,
      child: Padding(
        padding: EdgeInsets.only(top: descPadding.value),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.timer, size: 15,),
                SizedBox(
                  width: 5,
                ),
                Text("|"),
                SizedBox(
                  width: 5,
                ),
                Text("2h 32min ", style: TextStyle(fontSize: 9, fontFamily: "Montserrat-Bold"),),
                SizedBox(
                  width: 5,
                ),
                Text("|"),
                SizedBox(
                  width: 5,
                ),
                Text("8 October 2017", style: TextStyle(fontSize: 9, fontFamily: "Montserrat-Bold"),)
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 20,
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size:starScale.value,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("8.5")
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
