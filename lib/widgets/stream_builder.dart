import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';

class StreamBuilderWidget extends StatelessWidget {
  final String _title;

  StreamBuilderWidget(this._title);

  @override
  Widget build(BuildContext context) {
    var firestore = Firestore.instance;
    return Container(
      padding:
          EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
      child: StreamBuilder(
          stream: firestore.collection(_title).snapshots(),
          builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (_, index) {
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 15.0, bottom: 15.0, left: 10.0, right: 10.0),
                        child: ConfigurableExpansionTile(
                          animatedWidgetPrecedingHeader: Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 15.0,
                            ),
                          ),
                          header: Expanded(
                            child: Container(
                                child: Text(
                                    snapshot.data.documents[index].data['qns'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        wordSpacing: 2.0,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: 0.5))),
                          ),
                          children: [
                            Container(
                                padding: EdgeInsets.only(
                                    left: 22.0,
                                    right: 10.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                child: Text(
                                    snapshot.data.documents[index].data['ans'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        wordSpacing: 2.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.values[0]))),
                          ],
                        ),
                      ),
                    );
                  });
          }),
    );
  }
}
