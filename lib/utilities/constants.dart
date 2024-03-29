import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
);
const kConditionTextStyle2 = TextStyle(
  fontSize: 20.0,
);
const KTextFielInputDecoration =InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(Icons.location_city,color: Colors.white,),
    hintText: 'Enter City name',hintStyle: TextStyle(color: Colors.black),
    border: OutlineInputBorder(
      borderRadius:BorderRadius.all(Radius.circular(10.0)),
    )

);