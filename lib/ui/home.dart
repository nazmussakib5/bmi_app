import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BmiState();
  }
}

class BmiState extends State<Bmi> {
  final TextEditingController _ageConteroller = new TextEditingController();
  final TextEditingController _heightConteroller = new TextEditingController();
  final TextEditingController _weightConteroller = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = "";

  String _finalResult = "";

  void _calculateBMI() {
    setState(() {
      int age = int.parse(_ageConteroller.text);
      double height = double.parse(_heightConteroller.text);
      inches = height * 12;

      double weight = double.parse(_weightConteroller.text);

      if ((_ageConteroller.text.isNotEmpty || age > 0) &&
          ((_heightConteroller.text.isNotEmpty || inches > 0) &&
              (_weightConteroller.text.isNotEmpty || weight > 0))) {
        result = weight / (inches * inches) * 703;

        //Do the reaing
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "UnderWeight";
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          _resultReading = "Great shape!"; //Noraml
        } else if (double.parse(result.toStringAsFixed(1)) >= 25.0 &&
            result < 30) {
          _resultReading = "Overweight";
        } else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "Obese";
        } else {
          result = 0.0;
        }
      }
    });
    _finalResult = "Your BMI : ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            new Image.asset(
              'images/bmilogo.png',
              height: 85.0,
              width: 75.0,
            ),
            new Container(
              margin: const EdgeInsets.all(2.0),
              height: 245.0,
              width: 290.0,
              color: Colors.grey.shade300,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageConteroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Age',
                        hintText: 'e.g: 34',
                        icon: new Icon(Icons.person_outline)),
                  ),

                  new TextField(
                    controller: _heightConteroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Height in feet',
                        hintText: 'e.g: 6.5',
                        icon: new Icon(Icons.insert_chart)),
                  ),

                  new TextField(
                    controller: _weightConteroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Weight in lbs',
                        hintText: 'e.g: 180',
                        icon: new Icon(Icons.line_weight)),
                  ),

                  new Padding(padding: new EdgeInsets.all(5.6)),
                  //calcultare button

                  new Container(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        onPressed: _calculateBMI,
                        color: Colors.pinkAccent,
                        child: new Text('Calculate'),
                        textColor: Colors.white,
                      ))
                ],
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "$_finalResult",
                  style: new TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                    //fontStyle: FontStyle.italic,
                    fontSize: 19.9,
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new Text(
                  "$_resultReading",
                  style: new TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.w500,
                    fontSize: 19.9,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
