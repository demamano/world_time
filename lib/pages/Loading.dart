import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/pages/Location.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  final String location, url;
  Loading({required this.location, required this.url});

  @override
  State<Loading> createState() => _LoadingState(location, url);
}

class _LoadingState extends State<Loading> {
  String time = 'loading';
  
  final String location;
  
  final String url;
  _LoadingState(this.location, this.url);
  void worldTimeSetup() async {
    WorldTime instance =
        // WorldTime('Argentina', 'assets/berlin.png', 'Asia/Shanghai');
        WorldTime('$location', 'assets/berlin.png', '$url');
    print(location);
    print(url);

    await instance.getTime();

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime,
      },
    );

    // setState(() {
    //   time = instance.time;
    // });
  }
  // Future getData() async {
  //   Response response = await http
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //   print(data['id']);
  // }

  @override
  void initState() {
    super.initState();
    worldTimeSetup();
    print(location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 55,
        ),
      ),
    );
  }
}
