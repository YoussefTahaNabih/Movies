import 'package:equatable/equatable.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();
  @override
  List<Object?> get props => [];
}

class OnTheAirTvEvent extends TvEvent {}

class GetPopularTvEvent extends TvEvent {}

class GetTopRatedTvEvent extends TvEvent {}

class GetSeeMorePopularTvEvent extends TvEvent {}

class GetSeeMoreTopRatedTvEvent extends TvEvent {}
