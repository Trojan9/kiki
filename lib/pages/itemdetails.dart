import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:webscrollbar/webscrollbar.dart';

const int DEFAULT_SCROLL_SPEED = 130;
const int DEFAULT_NORMAL_SCROLL_ANIMATION_LENGTH_MS = 250;
final List<String> images = [
  'assets/banner3.jpg',
  'assets/banner4.jpg',
];

class Itemdetails extends StatefulWidget {
  @override
  _ItemdetailsState createState() => _ItemdetailsState();
}

class _ItemdetailsState extends State<Itemdetails> {
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
              child: Column(
                children: [productpics()],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget productpics() {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Image.asset("assets/product.jpg"),
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
