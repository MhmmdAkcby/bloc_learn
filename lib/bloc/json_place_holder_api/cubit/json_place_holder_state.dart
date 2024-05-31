import 'package:bloc_pattern_learn/bloc/json_place_holder_api/model/json_place_holder_model.dart';
import 'package:equatable/equatable.dart';

class JsonPlaceHolderState extends Equatable {
  final bool isLoading;
  final List<JsonPlaceHolderModel>? model;

  const JsonPlaceHolderState({this.model, this.isLoading = false});

  @override
  List<Object?> get props => [isLoading, model];

  JsonPlaceHolderState copyWith({
    bool? isLoading,
    List<JsonPlaceHolderModel>? model,
  }) {
    return JsonPlaceHolderState(
      isLoading: isLoading ?? this.isLoading,
      model: model ?? this.model,
    );
  }
}
