import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/pages/Loading.dart';
import 'package:flutter_application_1/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  final String location = '';

  final String url = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Dog'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black54,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    // Tell your textfield which controller it owns
                    controller: nameController,
                    // Every single time the text changes in a
                    // TextField, this onChanged callback is called
                    // and it passes in the value.
                    //
                    // Set the text of your controller to
                    // to the next value.
                    // onChanged: (url) nameController.text = url,
                    onChanged: (url) {
                      url = nameController.text;
                      // print(url);
                    },
                    decoration: InputDecoration(
                      labelText: 'Location url',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    controller: locationController,
                    onChanged: (location) {
                      location = locationController.text;

                      // print(location);
                    },
                    decoration: InputDecoration(
                      labelText: "Location",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    return ElevatedButton(
                      onPressed: () {
                        String location = locationController.text;
                        String url = nameController.text;
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              Loading(location: location, url: url),
                        ));
                      },
                      // color: Colors.indigoAccent,
                      child: Text('Submit Pup'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
