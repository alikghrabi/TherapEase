import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapease/Controllers/SearchingController.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchingController>(() => SearchingController());
  }
}