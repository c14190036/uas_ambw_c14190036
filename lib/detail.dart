import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uas_ambw_c14190036/dataAPI.dart';

import 'dataclass.dart';

class detail extends StatefulWidget {
  const detail({Key? key}) : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  Service serviceAPI = Service();
  late Future<List<cData>> listData;

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
            child: Container(
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
                            children: <Widget>[
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(isiData[index].cthumbnail),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(5)),
                                  Text(
                                    "Title : ",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${isiData[index].ctitle}",
                                      style: TextStyle(fontSize: 16),
                                      softWrap: false,
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(5)),
                                  Text("Desription : ",
                                      style: TextStyle(fontSize: 16)),
                                  Expanded(
                                    child: Text(
                                      "${isiData[index].cdescription}",
                                      style: TextStyle(fontSize: 16),
                                      softWrap: false,
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 16, 5, 0)),
                                  Text(
                                    "Link : ",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${isiData[index].clink}",
                                      style: TextStyle(fontSize: 16),
                                      softWrap: false,
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.all(5)),
                                  Text("Date : "),
                                  Text("${isiData[index].cpubDate}"),
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
            ),
          )
        ],
      ),
    );
  }
}
