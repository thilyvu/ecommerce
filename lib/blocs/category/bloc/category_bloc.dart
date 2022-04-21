import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/category_model.dart';
import '../../../repositories/category/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubcription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
      on<UpdateCategories>(_onUpdateCategories);
  }
  void _onLoadCategories(event, Emitter<CategoryState> emit) {
   _categorySubcription?.cancel();
    _categorySubcription = _categoryRepository
        .getAllCategories()
        .listen((categories) => add(UpdateCategories(categories)));
  }
  void _onUpdateCategories(event, Emitter<CategoryState> emit) {
        emit (CategoryLoaded(categories: event.categories));
  }
}
