import 'package:get/get_rx/src/rx_types/rx_types.dart';

mixin ScreenLoadingAndErrorMixin {
  final RxBool _isLoading = true.obs;

  final RxnString _error = RxnString();

  void setLoadingToTrue() => _isLoading.value = true;

  void setLoadingToFalse() => _isLoading.value = false;

  void setError(String? errorString) => _error.value = errorString;

  bool get getIsLoading => _isLoading.value;

  String? get getError => _error.value;
}
