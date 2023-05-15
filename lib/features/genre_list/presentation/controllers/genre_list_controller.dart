import 'package:get/get.dart';
import 'package:music_app/shared/models/genre_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/mixins/screen_loading_and_error_mixin.dart';
import '../../data/repositories/genre_list_repository.dart';

class GenreListController extends GetxController
    with ScreenLoadingAndErrorMixin {
  final GenreListRepository _genreListRepository;
  final RxList<GenreModel> genres = RxList([]);

  GenreListController(GenreListRepository genreListRepository)
      : _genreListRepository = genreListRepository;

  @override
  void onInit() {
    getGenreList();
    super.onInit();
  }

  Future<void> getGenreList() async {
    setLoadingToTrue();
    setError(null);

    final getGenresResponse = await _genreListRepository.getGenreList();

    getGenresResponse.fold((Failure failureResponse) {
      if (failureResponse is GetGenreListFailure) {
        setError(failureResponse.message);
      }
    }, (List<GenreModel> genreResponse) {
      print(genreResponse);
      genres.value = genreResponse;
    });

    setLoadingToFalse();
  }
}
