import 'package:flutter/material.dart';
import 'package:time_app/services/world_time.dart';

class chooseLocation extends StatefulWidget {
  const chooseLocation({Key? key}) : super(key: key);

  @override
  State<chooseLocation> createState() => _chooseLocationState();
}

class _chooseLocationState extends State<chooseLocation> {
  int counter=0;


  List<WorldTime> locations = [
    WorldTime(location: "Istanbul", flag: "https://countryflagsapi.com/png/tr", url: "Europe/Istanbul"),
    WorldTime(location: "Berlin", flag: "https://countryflagsapi.com/png/germany", url: "Europe/Berlin"),
    WorldTime(location: "Los Angeles", flag: "https://countryflagsapi.com/png/us", url: "America/Los_Angeles"),
    WorldTime(location: "Tokyo", flag: "https://countryflagsapi.com/png/japan", url: "Asia/Tokyo"),
    WorldTime(location: "Seoul", flag: "https://countryflagsapi.com/png/kr", url: "Asia/Seoul"),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getData();
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1,horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(locations[index].flag),
                ),
                title: Text(locations[index].location),
              ),
            ),
          );
        },
      ),
    );
  }
}
