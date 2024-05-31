import 'package:bloc_pattern_learn/bloc/json_place_holder_api/cubit/json_place_holder_cubit.dart';
import 'package:bloc_pattern_learn/bloc/json_place_holder_api/product/service/project_dio.dart';
import 'package:bloc_pattern_learn/bloc/json_place_holder_api/service/json_place_holder_service.dart';
import 'package:bloc_pattern_learn/bloc/json_place_holder_api/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with ProjectDioMixin {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JsonPlaceHolderCubit(JsonPlaceHolderService(service)),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
