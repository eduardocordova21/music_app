import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:music_app/features/genre_details_list/presentation/screens/genre_details_screen.dart';
import 'package:music_app/features/genre_list/presentation/controllers/genre_list_controller.dart';
import 'package:music_app/shared/widgets/screen_widget.dart';

import '../../../../shared/widgets/img_and_title_row_widget.dart';

class GenreListScreen extends StatelessWidget {
  static const routeName = "/genre-list";

  const GenreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final genreListCtlr = Get.find<GenreListController>();
    return Obx(
      () => ScreenWidget(
        isLoading: false,
        title: "Lista de Genêros",
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.separated(
                itemBuilder: (_, index) {
                  final genre = genreListCtlr.genres[index];
                  return InkWell(
                    onTap: () => Get.toNamed(
                        "${GenreListScreen.routeName}${GenreDetailsScreen.routeName}",
                        arguments: genre),
                    child: ImgAndTitleRowWidget(
                      title: genre.title,
                      heroTag: genre.title,
                      img: genre.img,
                    ),
                  );
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(height: 12);
                },
                itemCount: genreListCtlr.genres.length,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ]),
      ),
    );
  }
}
