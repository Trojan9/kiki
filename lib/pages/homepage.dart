import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiki/productlist.dart';
import 'package:webscrollbar/webscrollbar.dart';

const int DEFAULT_SCROLL_SPEED = 130;
const int DEFAULT_NORMAL_SCROLL_ANIMATION_LENGTH_MS = 250;
final List<String> images = [
  'assets/banner3.jpg',
  'assets/banner4.jpg',
];

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ScrollController controller = ScrollController();
  final int scrollSpeed = DEFAULT_SCROLL_SPEED;
  final CarouselController _controllercontrol = CarouselController();

  final Curve curve = Curves.linear;
  final int scrollAnimationLength = DEFAULT_NORMAL_SCROLL_ANIMATION_LENGTH_MS;
  double _scroll = 0;
  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      if (controller.position.activity is IdleScrollActivity) {
        _scroll = controller.position.extentBefore;
      }
    });
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (RawKeyEvent event) {
        int millis = scrollAnimationLength;

        if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
          setState(() {
            _scroll += scrollSpeed;
          });
          if (_scroll > controller.position.maxScrollExtent) {
            _scroll = controller.position.maxScrollExtent;
            millis = scrollAnimationLength ~/ 2;
          }
          if (_scroll < 0) {
            _scroll = 0;
            millis = scrollAnimationLength ~/ 2;
          }
          controller.animateTo(
            _scroll,
            duration: Duration(milliseconds: millis),
            curve: curve,
          );
        }
        if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
          setState(() {
            _scroll -= scrollSpeed;
          });
          if (_scroll > controller.position.maxScrollExtent) {
            _scroll = controller.position.maxScrollExtent;
            millis = scrollAnimationLength ~/ 2;
          }
          if (_scroll < 0) {
            _scroll = 0;
            millis = scrollAnimationLength ~/ 2;
          }
          controller.animateTo(
            _scroll,
            duration: Duration(milliseconds: millis),
            curve: curve,
          );
        }
        // print(event.logicalKey.keyLabel);
      },
      autofocus: true,
      child: Container(
        color: Colors.red,
        child: WebScrollBar(
          controller: controller,
          visibleHeight: 50,
          child: Scaffold(
            appBar: CustomAppBar(),
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("Kiki Collections",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              "Shop from our current collections",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Image.asset(
                            "assets/banner.png",
                            height: MediaQuery.of(context).size.height / 1.5,
                            // width: MediaQuery.of(context).size.width,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 8,
                          right: MediaQuery.of(context).size.width / 8,
                          top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("ACCESSORIES",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                          ),
                          GridView.count(
                              crossAxisCount: 3,
                              //scrollDirection: Axis.vertical,
                              //itemCount: newdesignreadywearlist.length,
                              primary: false,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              childAspectRatio: (2 / 2),
                              children: List.generate(
                                6,
                                (index) {
                                  return Listproducts();
                                },
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider.builder(
                          itemCount: images.length,
                          carouselController: _controllercontrol,
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            viewportFraction: 1.0,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                                child: Center(
                                    child: Image.asset(images[index],
                                        // fit: BoxFit.fill,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width)));
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 8,
                          right: MediaQuery.of(context).size.width / 8,
                          top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("NEW ARRIVAL",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                          ),
                          GridView.count(
                              crossAxisCount: 3,
                              //scrollDirection: Axis.vertical,
                              //itemCount: newdesignreadywearlist.length,
                              primary: false,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              childAspectRatio: (2 / 2),
                              children: List.generate(
                                6,
                                (index) {
                                  return Listproducts();
                                },
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    Container(
                      color: Colors.grey[350],
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text(""), Text("@Copyright 2020")],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key key})
      : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                "assets/you1.png",
                width: 50,
                height: 50,
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "CAMERA",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Text(
                    "ACCESSORIES",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Text(
                    "SHOES",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Text(
                    "WRISTWATCHES",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Text(
                    "PERFUMES",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.black,
                      ),
                      Text(
                        "Account",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: 25,
                        color: Colors.black,
                      ),
                      Positioned(
                        right: 0.0,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 13,
                            minHeight: 13,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 1),
                            child: Text(
                              //mynewCartlength == null ? "0" :
                              "0",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      // actions: <Widget>[
      //   IconButton(
      //     icon: Icon(
      //       Icons.add,
      //       color: Colors.white,
      //     ),
      //   ),
      // ],
    );
  }
}
