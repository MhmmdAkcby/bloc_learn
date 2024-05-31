import 'package:bloc_pattern_learn/bloc/json_place_holder_api/cubit/json_place_holder_state.dart';
import 'package:bloc_pattern_learn/bloc/json_place_holder_api/service/json_place_holder_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JsonPlaceHolderCubit extends Cubit<JsonPlaceHolderState> {
  JsonPlaceHolderCubit(IJsonPlaceHolderService jsonService)
      : _jsonService = jsonService,
        super(const JsonPlaceHolderState());

  final IJsonPlaceHolderService _jsonService;

  Future<void> fetchItemPostService() async {
    emit(state.copyWith(isLoading: true));
    final response = await _jsonService.fetchItemsPostService();
    emit(state.copyWith(isLoading: false, model: response));
  }
}
