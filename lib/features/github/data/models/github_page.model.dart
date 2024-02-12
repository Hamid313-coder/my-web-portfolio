import 'package:flutter/material.dart';

class GithubPageModel {
  final IconData icon;
  final String title;
  final String handle;
  final String url;

  GithubPageModel(
      {required this.icon,
      required this.title,
      required this.handle,
      required this.url});
}
