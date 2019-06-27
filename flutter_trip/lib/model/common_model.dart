/// subNavListItem
/// localNavListItem
/// banner
class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
        icon: json['icon'],
        title: json['title'],
        url: json['url'],
        statusBarColor: json['statusBarColor'],
        hideAppBar: json['hideAppBar']);
  }

  Map<String, dynamic> toJson() =>
      {
        'icon': this.icon,
        'title': this.title,
        'url': this.url,
        'statusBarColor': this.statusBarColor,
        'hideAppBar': this.hideAppBar
      };
}

class GridNavItem {
  final String startColor;
  final String endColor;
  final CommonModel mainItem;
  final CommonModel item1;
  final CommonModel item2;
  final CommonModel item3;
  final CommonModel item4;

  GridNavItem({this.startColor,
    this.endColor,
    this.mainItem,
    this.item1,
    this.item2,
    this.item3,
    this.item4});

  factory GridNavItem.fromJson(Map<String, dynamic> json) {
    return GridNavItem(
      startColor: json['statColor'],
      endColor: json['endColor'],
      mainItem: json['mainItem'],
      item1: CommonModel.fromJson(json['item1']),
      item2: CommonModel.fromJson(json['item2']),
      item3: CommonModel.fromJson(json['item3']),
      item4: CommonModel.fromJson(json['item4']),
    );
  }
}
