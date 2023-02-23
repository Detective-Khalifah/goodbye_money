import 'package:flutter/material.dart';

abstract class WidgetWithTitle extends StatelessWidget {
  const WidgetWithTitle({Key? key, required this.title}) : super(key: key);
  final String title;
}
