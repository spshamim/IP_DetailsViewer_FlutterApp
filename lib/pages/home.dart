import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route != null && route.settings.arguments != null) {
      data = route.settings.arguments as Map<String, dynamic>;
    }

    // List of key-value pairs to display
    final List<Map<String, String>> items = [
      {'IP': data['query'] ?? 'N/A'},
      {'Location': '${data['city']}, ${data['regionName']?.split(' ')?.first}, ${data['country']}'},
      {'Timezone': data['timezone'] ?? 'N/A'},
      {'ISP': data['isp'] ?? 'N/A'},
      {'ORG': data['org'] ?? 'N/A'},
      {'Latitude': data['lat'].toString()},
      {'Longitude': data['lon'].toString()},
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        String key = items[index].keys.first;
                        String value = items[index][key]!;

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(Icons.info, color: Colors.blue[900]),
                            title: Text(
                              key,
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 21.0,
                              ),
                            ),
                            subtitle: Text(
                              value,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        SystemNavigator.pop(); // Close the app
                      },
                      child: Text(
                        'Close App',
                        style: TextStyle(fontSize: 16, color: Colors.red[900], fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
