import 'package:flutter/material.dart';
import 'package:music_app/shared/widgets/screen_widget.dart';

class GenreListScreen extends StatelessWidget {
  static const routeName = "/genre-list";

  const GenreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      isLoading: false,
      title: "Lista de Genêros",
      error: "Erro ao carregar lista de genêros",
      onTryAgain: () {},
      child: Container(),
    );
  }
}
