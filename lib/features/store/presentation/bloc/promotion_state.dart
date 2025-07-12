import 'package:equatable/equatable.dart';
import '../../domain/entities/promotion_entity.dart';

abstract class PromotionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PromotionInitial extends PromotionState {}

class PromotionLoading extends PromotionState {}

class PromotionLoaded extends PromotionState {
  final List<PromotionEntity> promotions;
  final bool hasMore;

  PromotionLoaded({required this.promotions, required this.hasMore});

  @override
  List<Object?> get props => [promotions, hasMore];
}

class PromotionError extends PromotionState {
  final String message;
  PromotionError(this.message);

  @override
  List<Object?> get props => [message];
}
