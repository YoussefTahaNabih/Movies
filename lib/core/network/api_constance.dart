class ApiConstance {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = 'd690efcbab665a7c868b859dc26dcf70';

  // ! MOVIES Path
  static const nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const popularMoviesPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const topRatedMoviesPath = '$baseUrl/movie/top_rated?api_key=$apiKey';

  static moviesDetailsPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';
  static recommendationPath(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  // ! TVS Path
  static const onTheAirTvPath = '$baseUrl/tv/on_the_air?api_key=$apiKey';
  static const popularTvPath = '$baseUrl/tv/popular?api_key=$apiKey';
  static const topRatedTvPath = '$baseUrl/tv/airing_today?api_key=$apiKey';

  static tvDetailsPath(int tvId) => '$baseUrl/tv/$tvId?api_key=$apiKey';

  static tvRecommendationPath(int tvId) =>
      '$baseUrl/tv/$tvId/recommendations?api_key=$apiKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';
}
// https://api.themoviedb.org/3/movie/614934/recommendations?api_key=d690efcbab665a7c868b859dc26dcf70