class Api {
  static final String HOST = "http://gank.io";
  static final String API = "api";


  ///随机数据生成
  ///数据类型：福利 | Android | iOS | 休息视频 | 拓展资源 | 前端
  ///个数： 数字，大于0
  ///例：
  ///http://gank.io/api/random/data/Android/20

  static final String RANDOM_DATA = "$HOST/$API/random/data";

  ///  每日数据： http://gank.io/api/day/年/月/日
  ///
  ///  例：
  ///  http://gank.io/api/day/2015/08/06
  static final String DAY_DATA = "$HOST/$API/day";

  ///分类数据: http://gank.io/api/data/数据类型/请求个数/第几页
  ///
  ///  数据类型： 福利 | Android | iOS | 休息视频 | 拓展资源 | 前端 | all
  ///  请求个数： 数字，大于0
  ///  第几页：数字，大于0
  ///  例：
  ///  http://gank.io/api/data/Android/10/1
  ///  http://gank.io/api/data/福利/10/1
  ///  http://gank.io/api/data/iOS/20/2
  ///  http://gank.io/api/data/all/20/2*/

  static final String DATA_DATA = "$HOST/$API/data";

  ///  获取发过干货日期接口:
  ///  http://gank.io/api/day/history 方式 GET
  static final String DAY_HISTORY_DATA = "$HOST/$API/history";

  ///  搜索 API
  ///  http://gank.io/api/search/query/listview/category/Android/count/10/page/1
  ///  注：
  ///  category 后面可接受参数 all | Android | iOS | 休息视频 | 福利 | 拓展资源 | 前端 | 瞎推荐 | App
  ///  count 最大 50
  static final String SEARCH = "$HOST/$API/search/query/listview";

}