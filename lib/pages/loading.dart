import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ipproject/services/ip_finder.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupIP() async {
    IP instance = IP();
    await instance.getDetails();
    if (mounted) {
      Map<String, dynamic> convertedData = Map<String, dynamic>.from(instance.dataRES);
      Navigator.pushReplacementNamed(context, '/home', arguments: convertedData);
    }
  }

  @override
  void initState() {
    super.initState();
    setupIP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitCircle(
                color: Colors.white,
                size: 90.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Fetching IP details...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
