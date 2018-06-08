import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:gank/data/data.dart';
import 'package:gank/api/Api.dart';

///获取特定日期的详情 比如今天
Future<DayData> fetchDayData({String year,String month,String day}) async {
  final response = await http.get(Api.DAY_DATA+'/$year/$month/$day');
  final jsons = json.decode(response.body);
  return new DayData.fromjson(jsons);
}

///获取特定类别的 列表
Future<CategoryData> fetchCatgory({String category,int page}) async {
  final response = await http.get(Api.DATA_DATA+'/$category/20/$page');
  final jsons = json.decode(response.body);
  return new CategoryData.fromjson(jsons);
}
