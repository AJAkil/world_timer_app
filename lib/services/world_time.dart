import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // the location the user sees
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location to the api end point

  WorldTime({this.location, this.flag, this.url});

  String correctTime(String dateTime, String offset) {
    DateTime now = DateTime.parse(dateTime);
    return now.add(Duration(hours: int.parse(offset))).toString();
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
      time = correctTime(dateTime, offset);
    } catch (e) {
      print('Caught error $e');
      time = 'could not get the correct time';
    }
  }
}
