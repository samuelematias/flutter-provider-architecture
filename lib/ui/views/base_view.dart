import 'package:flutter/material.dart';
import 'package:flutter_provider_architecture/core/viewmodels/base_model.dart';
import 'package:flutter_provider_architecture/locator.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatelessWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;

  BaseView({this.builder});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (BuildContext context) => locator<T>(),
      child: Consumer<T>(builder: builder),
    );
  }
}
