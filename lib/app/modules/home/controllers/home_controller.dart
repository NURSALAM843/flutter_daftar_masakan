import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_masakan/app/models/masakan_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    allMasakan();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<MasakanModel>> allMasakan() async {
    var response = await Dio().get(
      "https://resep-hari-ini.vercel.app/api/recipes",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return MasakanModel.fromJsonList(response.data['results']);
  }
}
