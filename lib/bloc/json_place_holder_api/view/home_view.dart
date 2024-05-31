import 'package:bloc_pattern_learn/bloc/json_place_holder_api/cubit/json_place_holder_cubit.dart';
import 'package:bloc_pattern_learn/bloc/json_place_holder_api/cubit/json_place_holder_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Learn'),
      ),
      body: BlocBuilder<JsonPlaceHolderCubit, JsonPlaceHolderState>(
        builder: (context, state) {
          return state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: state.model?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(state.model?[index].title ?? ''),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

abstract class HomeState<T extends HomeView> extends State<T> {
  @override
  void initState() {
    super.initState();
    context.read<JsonPlaceHolderCubit>().fetchItemPostService();
  }
}
