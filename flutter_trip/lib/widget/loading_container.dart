import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// loading
/// 数据加载时的loading
class LoadingContainer extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool isCover;

  const LoadingContainer(
      {Key key,
      @required this.child,
      this.isLoading = true,
      this.isCover = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return !isLoading
        ? !this.isCover ? child : _loadingWidget
        : Stack(
            children: <Widget>[child, _loadingWidget],
          );
  }

  Widget get _loadingWidget {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
