import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/entities/movie.dart';

import '../../../domain/entities/see_more_details.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  final List<SeeMore> seeMorePopularMovies;
  final RequestState seeMorePularState;
  final String seeMorePopularMessage;

  final List<SeeMore> seeMoreTopRatedMovies;
  final RequestState seeMoreTopRatedState;
  final String seeMoreTopRatedMessage;

  const MoviesState({
    // ! Now Playing
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',

    // ! Popular
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',

    // ! Top Rated
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',

    // ! See More Popular
    this.seeMorePopularMovies = const [],
    this.seeMorePularState = RequestState.loading,
    this.seeMorePopularMessage = '',

    // ! See More Top Rated
    this.seeMoreTopRatedMovies = const [],
    this.seeMoreTopRatedState = RequestState.loading,
    this.seeMoreTopRatedMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
    List<SeeMore>? seeMorePopularMovies,
    RequestState? seeMorePularState,
    String? seeMorePopularMessage,
    List<SeeMore>? seeMoreTopRatedMovies,
    RequestState? seeMoreTopRatedState,
    String? seeMoreTopRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      seeMorePopularMovies: seeMorePopularMovies ?? this.seeMorePopularMovies,
      seeMorePularState: seeMorePularState ?? this.seeMorePularState,
      seeMorePopularMessage:
          seeMorePopularMessage ?? this.seeMorePopularMessage,
      seeMoreTopRatedMovies:
          seeMoreTopRatedMovies ?? this.seeMoreTopRatedMovies,
      seeMoreTopRatedState: seeMoreTopRatedState ?? this.seeMoreTopRatedState,
      seeMoreTopRatedMessage:
          seeMoreTopRatedMessage ?? this.seeMoreTopRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularState,
        popularMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage,
        seeMorePopularMovies,
        seeMorePularState,
        seeMorePopularMessage,
        seeMoreTopRatedMovies,
        seeMoreTopRatedState,
        seeMoreTopRatedMessage
      ];
}
