import 'package:gank/data/data.dart';
import 'package:gank/api/netclient.dart';
import 'package:flutter/material.dart';
import 'package:gank/page/detailpage.dart';
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    new Container(
      color: Color(0xFF63CA6C),
      child: new Center(

        child: new PageStateView(),

      ),
    );

  }

}

class PageStateView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new PageState();

}

class PageState extends State<PageStateView> {
  final List<Data> datas = [];
  int page = 1;
  final PageController controller = new PageController(
      viewportFraction: 2.0

  );

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<CategoryData>(
      future: fetchCatgory(category: '福利', page: page),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          datas.addAll(snapshot.data.results);
          return new PageView.builder(
              controller: controller,
              itemCount: datas.length,
              onPageChanged: (index) {

                if(index == datas.length-1 && datas.length != 0){
                  setState(() {
                    page = page+1;
                    print(page);
                  });
                }

              },
              itemBuilder: (context, index) {
                return new PageCardView(datas[index]);
              });
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }

        return new CircularProgressIndicator();
      },

    );
  }

}


class PageCardView extends StatelessWidget {
  final Data data;


  PageCardView(this.data);

  @override
  Widget build(BuildContext context) {
    return
      new Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(
                left: 30.0,
                top: 50.0,
                right: 30.0,
                bottom: 30.0

            ),
            child: new Container(
              height: 400.0,
              width: 300.0,
              child:new GestureDetector(
                child:  new Card(
                    elevation: 18.0,
                    child: new Image.network(data.url, fit: BoxFit.cover,)
                ),
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (context){
                        return new DetailPage(data.desc.split('-')[0],data.desc.split('-')[1],data.desc.split('-')[2]);
                      }));
                },
              ),),
          ),
          new Text(
            '  ${data.desc.replaceAll("-", '.')} 干货', style: new TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),)
        ],
      );
  }

}