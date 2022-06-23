import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uas_ambw_c14190036/dataAPI.dart';
import 'package:uas_ambw_c14190036/like.dart';
import 'package:uas_ambw_c14190036/detail.dart';

import 'dataclass.dart';

Service serviceAPI = Service();
late Future<List<cData>> listData;

void main() {
  runApp(MaterialApp(
    home: Home(),
    title: "Flutter",
    debugShowCheckedModeBanner: true,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    listData = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<cData>>(
              future: listData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<cData> isiData = snapshot.data!;
                  return ListView.builder(
                    itemCount: isiData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Text(isiData[index].ctitle),
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(isiData[index].cthumbnail),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextButton(
                                  child: Icon(Icons.favorite),
                                  onPressed: () {/* ... */},
                                ),
                                const SizedBox(width: 0),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              },
            ),
          )
        ],
      ),
    );
  }

  void showData(String id) async {
    cData response = await serviceAPI.getSingleData(id);
    log("data = ${response.ctitle}");
  }
}
