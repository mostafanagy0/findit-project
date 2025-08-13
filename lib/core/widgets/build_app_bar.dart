import 'package:findit/core/utils/text_style.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(context, {required String title}) => AppBar(
  backgroundColor: Colors.white,
  title: Center(child: Text(title, style: TextStyles.font18Bold)),
);
