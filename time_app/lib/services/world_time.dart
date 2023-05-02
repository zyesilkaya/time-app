import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  late String location; //location name for the UI
  late String time;
  late String flag; //url to an asset flag icon
  late String url; //location url
  late bool isDayTime;

  WorldTime({required this.location,required this.flag,required this.url});


  Future<void> getData() async {
    try{
      //make the request
      Response response = await get(Uri.parse('https://www.timeapi.io/api/Time/current/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);
      //print(data);
      String dateTime = data['dateTime'];
      //print(dateTime);
      DateTime now = DateTime.parse(dateTime);

      //set the time property
      isDayTime = now.hour > 6 && now.hour < 20? true : false;
      time = DateFormat.jm().format(now);
      print(time);

    }catch(e){
      time = "Could not get time data";
    }
  }

}