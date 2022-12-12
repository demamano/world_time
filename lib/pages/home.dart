import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:world_time/pages/Loading.dart';
import 'package:world_time/services/world_time.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Map data;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String bgImage = data['isDaytime'] ? 'day.jpeg' : 'night.jpeg';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text('edit Location'),
              ),
              SizedBox(
                height: 10.0,
                width: 380.0,
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Image.asset(
                    data['flag'],
                    fit: BoxFit.contain,
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
