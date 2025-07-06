import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadInitialCategories extends CategoryEvent {}

class LoadMoreCategories extends CategoryEvent {}

class RefreshCategories extends CategoryEvent {}

class SearchCategories extends CategoryEvent {
  final String query;
  SearchCategories(this.query);

  @override
  List<Object?> get props => [query];
}
