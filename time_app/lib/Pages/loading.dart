import 'package:flutter/material.dart';
import 'package:time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  String time = "loading";

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: "Istanbul", flag: "https://countryflagsapi.com/png/tr", url: "Europe/Istanbul");
    await instance.getData();

    Navigator.pushReplacementNamed(context, "/home",arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
