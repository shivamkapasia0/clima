import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
String weatherMessage;
int humidity;
double windSpeed;
  String weatherIcon;
  int temprature;
  String cityName;
  String weatherDescription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }
  void updateUI(dynamic weatherData){
    setState(() {
if(weatherData == null){
  temprature =0;
  weatherIcon='Error';
  weatherMessage ='Unable to get weather data';
  cityName = '';
  return;
}

     cityName = weatherData['name'];
    double temp = weatherData['main']['temp'];
    temprature = temp.toInt();
    var condition = weatherData['weather'][0]
['id'];
    weatherIcon =weather.getWeatherIcon(condition);
humidity = weatherData['main']['humidity'];
windSpeed = weatherData['wind']['speed'];
    weatherDescription = weatherData['weather'][0]['description'];
weatherMessage = weather.getMessage(temprature);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Theme.of(context).primaryColor,
      body: Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            image: AssetImage('images/location_background.jpg'),
//            fit: BoxFit.cover,
//            colorFilter: ColorFilter.mode(
//                Colors.white.withOpacity(0.8), BlendMode.dstATop),
//          ),
//        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                     var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                     if(typedName!=null){
                      var weatherData = await weather.getCityWeather(typedName);
                      updateUI(weatherData);
                     }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all( 8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      '$temprature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                    Text(
                      '$weatherDescription',
                      style: kConditionTextStyle2,
                    ),
                    Text(
                      'Humidity : $humidity',
                      style: kConditionTextStyle2,
                    ),
                    Text(
                      'WindSpeed : $windSpeed',
                      style: kConditionTextStyle2,
                    ),
                    Text(
                      '$cityName',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
//              Padding(
//                padding: EdgeInsets.only(right: 15.0),
//                child: Text(
//                  "$weatherMessage in $cityName!",
//                  textAlign: TextAlign.right,
//                  style: kMessageTextStyle,
//                ),
//              ),
    SafeArea(
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    height: 200.0,
    child: ListView.builder(
    itemCount: 10,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) => Card(color: Colors.deepOrangeAccent,
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text('$cityName',),
    Text('$weatherDescription', ),
    Text('$temprature',  ),
    Image.network('https://openweathermap.org/img/w/01d.png'),
    Text('Jun 28, 2018', ),
    Text('18:30', ),
    ],
    ),
    ),
    )
    ),
    ),),)
            ],
          ),
        ),
      ),
    );
  }
}

//
