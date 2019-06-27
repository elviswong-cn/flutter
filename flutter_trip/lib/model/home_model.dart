import 'package:flutter_trip/model/config_model.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';
import 'package:flutter_trip/model/sales_box_model.dart';

class HomeModel {
  ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final GridNavModel gridNav;
  final List<CommonModel> subNavList;
  final SalesBoxModel salesBox;

  HomeModel(
      {this.config,
      this.bannerList,
      this.localNavList,
      this.gridNav,
      this.subNavList,
      this.salesBox});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var bannerStrlist = json['bannerList'] as List;
    var localNavStrList = json['localNavList'] as List;
    var subNavStrList = json['subNavList'] as List;
    return HomeModel(
      config: ConfigModel.fromJson(json['config']),
      bannerList:
          bannerStrlist.map((value) => CommonModel.fromJson(value)).toList(),
      localNavList:
          localNavStrList.map((value) => CommonModel.fromJson(value)).toList(),
      gridNav: GridNavModel.fromJson(json['gridNav']),
      subNavList:
          subNavStrList.map((value) => CommonModel.fromJson(value)).toList(),
      salesBox: SalesBoxModel.fromJson(json['salesBox']),
    );
  }
}
