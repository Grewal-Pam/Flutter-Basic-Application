import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 30, left: 30),
            color: Colors.orangeAccent,
            // height: 96.0,
            //width: 192.0,
            // margin: EdgeInsets.all(50.0),
            // margin: EdgeInsets.only(left: 50.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        //Text Widget displays a string of text with Single Style
                        "Margherita",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 30.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'Oxygen',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      //Text Widget displays a string of text with Single Style
                      "Tomato, Mozarella, Basil",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.w300,
                      ),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        //Text Widget displays a string of text with Single Style
                        "Marinara",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 30.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'Oxygen',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      //Text Widget displays a string of text with Single Style
                      "Tomato, Garlic",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.w300,
                      ),
                    ))
                  ],
                ),
                PizzaImageWidget(),
                OrderButton(),
              ],
            ))); //Container:as a div element
  }
}

class PizzaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage pizzaAsset = AssetImage('images/pizza1.png');
    Image image = Image(
      image: pizzaAsset,
      width: 400.0,
      height: 400.0,
    );
    return Container(child: image);
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 50.0),
      child: ElevatedButton(
        child: Text("Order Your Pizza!"),
        // color: Colors.lightGreen,
        //  elevation: 5.0,
        onPressed: () {
          order(context);
        },
      ),
    );
    return button;
  }

  void order(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Order Completed"),
      content: Text("Thanks for your order"),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
/*//LEARNING PURPOSE: JUST UNCOMMENT IF WANT TO RUN THIS
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      //used fo giving bg to the app, shape shadow color
      color: Colors.blueGrey,
      child: Center(
        //container that centres its content
        child: Text(
          sayHello(),
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.lightBlue, fontSize: 40.0),
        ),
      ),
    );
  }

  String sayHello() {
    String hello;
    DateTime now = new DateTime.now();
    int hour = now.hour;
    int minute = now.minute;
    if (hour < 12)
      hello = "Good Morning!";
    else if (hour >= 12 || now.hour <= 3)
      hello = "Good Afternoon";
    else if (hour > 3 || hour <= 7)
      hello = "Good Evening";
    else if (hour > 7) hello = "Good Night";

    String minutes =
        (minute < 10) ? "0" + minute.toString() : minute.toString();
    return "It's now " + hour.toString() + ":" + minutes + "\n" + hello;
  }
}


*/

/*
Container:  BOX CONSTRAINTS width & height is ignored in container. So add it in a center widget as a Child.
Margin- dist btw widget & other widget on screen
Padding - dist btw content of the wodget & its borders.
use edgeInSets constructor to specify t, l, r, c

Using Fonts : Import Font Files => pubspec.yaml => Use the font in Widgets
https://fonts.google.com/specimen/Oxygen?query=oxy

pubspec.yaml: File Containing information abt project metadata and dependencies
fonts:
      - family: Oxygen,
        fonts:
           - asset: fonts/Oxygen-Regular.ttf
           - asset: fonts/Oxygen-Bold.ttf
             weight: 700
           - asset: fonts/Oxygen-Light.ttf
         weight: 300


Row - list of child widget placed horizontally
Column - list of child widget placed vertically

Images assets https://freepngimg.com/png/6483-pizza-png-image/download

Raised Button- button with an elevation

State:  state is info that can be read synchronously when the widget is built & might change during the lifetime of widget.
Classes that inherit Stateful widget are immutable. The State is mutable.
how to use? - 1) create cls that exends stateful wideget, returning state.
2) create state class, with props that may change
3) implement BUILD method.
4) Call setState() method to make changes.

 */
