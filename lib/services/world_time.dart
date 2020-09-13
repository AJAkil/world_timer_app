import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // the location the user sees
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location to the api end point
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  bool setDayorNight(DateTime now){
    return now.hour > 6 && now.hour < 17 ? true : false;
  }

  DateTime correctTime(String dateTime, String offset) {
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    return now;
  }

  Future<void> getTime() async {
    try {
      // make the request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = json.decode(response.body);

      // get properties from the data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // Set the time property
      DateTime now = correctTime(dateTime, offset);
      isDayTime = setDayorNight(now);
      time = DateFormat.jm().format(now);


    } catch (e) {
      print('Caught error $e');
      time = 'could not get the correct time';
    }
  }
}
