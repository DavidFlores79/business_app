import 'package:equatable/equatable.dart';

abstract class PromotionEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadInitialPromotions extends PromotionEvent {}

class LoadMorePromotions extends PromotionEvent {}

class RefreshPromotions extends PromotionEvent {}

class SearchPromotions extends PromotionEvent {
  final String query;
  SearchPromotions(this.query);

  @override
  List<Object?> get props => [query];
}
