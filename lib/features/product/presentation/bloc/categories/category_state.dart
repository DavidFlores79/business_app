import 'package:equatable/equatable.dart';
import '../../../domain/entities/category_entity.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categories;
  final bool hasMore;

  CategoryLoaded({required this.categories, required this.hasMore});

  @override
  List<Object?> get props => [categories, hasMore];
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);

  @override
  List<Object?> get props => [message];
}
