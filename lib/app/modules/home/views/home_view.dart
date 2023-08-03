import 'package:flutter/material.dart';
import 'package:flutter_masakan/app/models/masakan_model.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Masakan'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.allMasakan(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snap.hasData) {
            return const Center(
              child: Text("Tidak Ada Data"),
            );
          }
          return ListView.builder(
            itemCount: snap.data!.length,
            itemBuilder: (context, index) {
              MasakanModel masakan = snap.data![index];
              return Column(
                children: [
                  ListTile(
                    hoverColor: const Color(0xFFFF9000),
                    leading: CircleAvatar(
                      child: Image.network(masakan.thumb!),
                    ),
                    title: Text(masakan.title!),
                    subtitle: Text(masakan.difficulty!),
                    trailing: Text(masakan.times!),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: const Divider(),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
