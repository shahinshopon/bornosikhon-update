import 'package:borno_shikhon/ui/responsive/size_config.dart';
import 'package:borno_shikhon/ui/route/route.dart';
import 'package:borno_shikhon/ui/views/home/detailspage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  var categoryname;
  var categorycolor;
  HomeScreen(this.categoryname,this.categorycolor);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference _refference =
      FirebaseFirestore.instance.collection('bornomala');
  late Stream<QuerySnapshot> _shorbornoData;
  // var _shorbornoData;
  @override
  void initState() {
    _shorbornoData =
        _refference.where(widget.categoryname, isEqualTo: true).snapshots();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _shorbornoData,
          builder: (_, snapshot) {
            if (snapshot.hasError)
              return Text('Error = ${snapshot.error}');
            else if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var docs = snapshot.data!.docs[0];
            return GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: docs['number'],
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Material(
                          color:widget.categorycolor,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(details,
                                  arguments: DetailsScreen(
                                      docs['alphabetsName'][i],
                                      docs['alphabetsDetails'][i],
                                      docs['alphabetsImage'][i]));
                            },
                            splashColor: Colors.white,
                            child: Center(
                              child: Text(
                                docs['alphabetsName'][i],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.screenHeight! * 0.08),
                              ),
                            ),
                          ))),
                );
              },
            );
          }),
    );
  }
}
