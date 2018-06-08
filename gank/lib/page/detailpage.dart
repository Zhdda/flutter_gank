import 'package:flutter/material.dart';
import 'package:gank/data/data.dart';
import 'package:gank/api/netclient.dart';
import 'package:gank/page/webpage.dart';

class DetailPage extends StatefulWidget {
  String year;
  String month;
  String day;

  DetailPage(this.year, this.month, this.day);

  @override
  DetailPageState createState() {
    return new DetailPageState(year, month, day);
  }


}

class DetailPageState extends State<DetailPage> {
  DayData dayData;
  String year;
  String month;
  String day;

  DetailPageState(this.year, this.month, this.day);

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<DayData>(
      future: fetchDayData(year: year, month: month, day: day),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          dayData = snapshot.data;
          List<Data> datas = [];
          datas.addAll(dayData.Android);
          datas.addAll(dayData.ios);
          datas.addAll(dayData.extend);
          datas.addAll(dayData.breakVideo);
          return new Scaffold(
            body: new CustomScrollView(
              slivers: <Widget>[ new SliverAppBar(
                pinned: true,
                expandedHeight: 250.0,
                elevation: 10.0,
                flexibleSpace: new FlexibleSpaceBar(
                    title: new Text('${year}.${month}.${day}',
                    ),
                    background:dayData.fuli.length == 0 ? new Container(color: Colors.greenAccent,): new Image.network(dayData.fuli[0].url,
                      fit: BoxFit.fitWidth,)
                ),
              ),
              new SliverList(
                delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return

                      new GestureDetector(
                        onTap: (){Navigator.push(context,new MaterialPageRoute(
                          builder: (context) {
                            return new WebPage(
                              url:datas[index].url ,
                                title: datas[index].desc);
                          }
                        ));},
                        child:
                        new Container(
                          child: new Padding(
                              padding: EdgeInsets.only(left: 20.0,top: 40.0,right: 20.0,bottom: 0.0),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                      datas[index].type,
                                      style: new TextStyle(
                                          color: Colors.lightGreen,
                                          fontSize: 10.0
                                      )),
                                  new Text(
                                    datas[index].desc,
                                    style: new TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0),
                                  ),
                                  new Divider()
                                ],
                              )
                          ),
                        )
                      );
                  },
                  childCount: datas == null?0:datas.length,
                ),
              )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }
        return new Center(
            child: new CircularProgressIndicator()
        );
      },

    );
  }

}