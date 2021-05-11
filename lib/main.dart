import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/home.dart';
import './screens/home.dart';

//https://flutteragency.com/how-to-solve-command-not-found-in-flutter/
//ios Simulator with xCode(mac) - https://developer.apple.com/xcode/
//https://www.youtube.com/watch?v=hL7pkX1Pfko

void main() => runApp(MaterialApp(
      title: "Calculate the fuel and have a pizza at Home",
      //home: Home(),
      home: FuelForm(),
      debugShowCheckedModeBanner: false,
    ));

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  String name = '';
  final _currencies = ['Dollars', 'Euro', 'Pounds'];
  final double _formDistance = 5.0;
  String _currency = 'Dollars'; //on default dollar to be loaded
  TextEditingController distController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
          backgroundColor: Colors.amber,
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      top: _formDistance, bottom: _formDistance)),
              TextField(
                controller: distController,
                //decoration: InputDecoration(hintText: 'Please enter your name'),
                decoration: InputDecoration(
                    labelText: 'Distance',
                    hintText: 'e.g. 123',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                keyboardType: TextInputType.number,
                // onChanged: (String string) {
                // setState(() {
                // name = string;
                // }
                // )
                // },
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: _formDistance, bottom: _formDistance)),
              TextField(
                controller: avgController,
                //decoration: InputDecoration(hintText: 'Please enter your name'),
                decoration: InputDecoration(
                    labelText: 'Distance per Unit',
                    hintText: 'e.g. 17',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                keyboardType: TextInputType.number,
                // onChanged: (String string) {
                // setState(() {
                // name = string;
                // }
                // )
                // },
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: _formDistance, bottom: _formDistance)),
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    controller: priceController,
                    //decoration: InputDecoration(hintText: 'Please enter your name'),
                    decoration: InputDecoration(
                        labelText: 'Price',
                        hintText: 'e.g. 1.65',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    keyboardType: TextInputType.number,
                    // onChanged: (String string) {
                    // setState(() {
                    // name = string;
                    // }
                    // )
                    // },
                  )),
                  Container(width: _formDistance * 5),
                  Expanded(
                      child: DropdownButton<String>(
                    items: _currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: _currency,
                    onChanged: (String value) {
                      _onDropDownChanged(value);
                    }, //on this dropdown items will be visble on UI
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.amber),
                          onPressed: () {
                            setState(() {
                              name = calculate();
                            });
                          },
                          child: Text(
                            'Submit',
                            textScaleFactor: 1.5,
                          ))),
                  Container(width: _formDistance * 5),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
                        onPressed: () {
                          setState(() {
                            reset();
                          });
                        },
                        child: Text(
                          'Reset',
                          textScaleFactor: 1.5,
                        )),
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
                        onPressed: () {
                          setState(() {
                            navigateToHome();
                          });
                        },
                        child: Text(
                          'Home',
                          textScaleFactor: 1.5,
                        )),
                  )
                ],
              ),
              // Text('Hello  ' + name + '!'),
              Text(name),
            ],
          ),
        ));
  }

  void _onDropDownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }

  String calculate() {
    double _distance = double.parse(distController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);
    double _totalCost = _distance / _consumption * _fuelCost;
    String _result = 'The total cost of your trip is ' +
        _totalCost.toStringAsFixed(2) +
        ' ' +
        _currency;
    return _result;
  }

  void reset() {
    distController.text = '';
    avgController.text = '';
    priceController.text = '';
    setState(() {
      name = '';
    });
  }

  void navigateToHome() async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }
}

/* //LEARNING PURPOSE
void main() => runApp(HelloFlutterApp());

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title & body , navig & ritungits a container
        debugShowCheckedModeBanner: false,
        title: "hello flutter app",
        home: Scaffold(
            //to show the app bar wher we out title floating  action bars other widgets
            appBar: AppBar(
              //ttool bar used to give title of app
              title: Text("Title in App Bar"), //shows text
            ),
            body: Home()));
  }
}*/
