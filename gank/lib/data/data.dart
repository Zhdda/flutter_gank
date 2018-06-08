class DayData {
  List<String> category;
  bool error;
  List<Data> Android;
  List<Data> ios;
  List<Data> breakVideo;
  List<Data> extend;
  List<Data> fuli;

  DayData({this.category, this.error, this.Android, this.ios, this.breakVideo,
    this.extend, this.fuli});

  factory DayData.fromjson(Map<String, dynamic> json){
    Map<String, dynamic> result = json['results'];
    List<dynamic> android = result['Android'];
    List<dynamic> ios = result['iOS'];
    List<dynamic> breakbean = result['休息视频'];
    List<dynamic> extend = result['拓展资源'];
    List<dynamic> fuli = result['福利'];
    return new DayData(
      category: new List<String>.from(json['category']),
      error: json['error'],
      Android: new List<Data>.generate(android== null ?0:android.length, (i) {
        return new Data.fromjson(android[i]);
      }),
      ios: new List<Data>.generate(ios == null ?0:ios.length, (i) {
        return new Data.fromjson(ios[i]);
      }),
      breakVideo: new List<Data>.generate(breakbean== null ?0:breakbean.length, (i) {
        return new Data.fromjson(breakbean[i]);
      }),
      extend: new List<Data>.generate(android== null ?0:extend.length, (i) {
        return new Data.fromjson(extend[i]);
      }),
      fuli: new List<Data>.generate(fuli== null ?0:fuli.length, (i) {
        return new Data.fromjson(fuli[i]);
      }),

    );
  }

  @override
  String toString() {
    return 'DayData{category: $category, error: $error, Android: $Android, ios: $ios, breakVideo: $breakVideo, extend: $extend, fuli: $fuli}';
  }
}


class CategoryData {
  bool error;
  List<Data> results;

  CategoryData({this.error, this.results});

  factory CategoryData.fromjson(Map<String, dynamic> json){
    List<dynamic> results = json['results'];
    return new CategoryData(
        error: json['error'],
        results: new List<Data>.generate(results.length, (index) {
          return new Data.fromjson(results[index]);
        })
    );
  }


}

class Data {
  String id;
  String createdAt;
  String publishedAt;
  String desc;
  String type;
  String url;
  bool used;
  String who;


  Data({this.id, this.createdAt, this.publishedAt, this.desc, this.type,
    this.url, this.used, this.who});

  factory Data.fromjson(Map<String, dynamic> json) {
    return new Data(
        id: json['_id'],
        createdAt: json['createdAt'],
        publishedAt: json['publishedAt'],
        desc: json['desc'],
        type: json['type'],
        url: json['url'],
        used: json['used'],
        who: json['who'],

    );
  }

}