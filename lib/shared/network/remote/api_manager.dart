import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../../models/TopRatedMovies_response.dart';
import '../../../models/details_data/Details_Data.dart';
import '../../../models/latestMovies_response.dart';
import '../../../models/popular/Popular_movies.dart';
import '../../../models/popularRespons.dart';

import '../../../models/search/Search_Model.dart';
import '../../../models/similarMovies/SimilarMovies.dart';
import '../../constants/constants.dart';

class ApiManager {
  //____________________________LatestMovies____________________________________

  static Future<PopularMovies_m> getPopular() async {
    //https://api.themoviedb.org/3/movie/popular?api_key=03dc69d016d798b7fb980e9925529385

    try {
      var url = Uri.https(BASE, PopularMovies, {
        "api_key": APIKEY,
      });
      Response sources = await http.get(url);
      print(sources.statusCode);
      var json = jsonDecode(sources.body);
      PopularMovies_m popularResponse = PopularMovies_m.fromJson(json);
      print('popularResponse');
      return popularResponse;
    } catch (e) {
      throw e;
    }
  }

//____________________________LatestMovies______________________________________
//   https://api.themoviedb.org/3/movie/latest?api_key=03dc69d016d798b7fb980e9925529385
  static Future<LatestMovies_response> getLatestMovies() async {
    var url = Uri.https(BASE, movieLatest, {
      "api_key": APIKEY,
    });
    try {
      Response LatestMovies = await http.get(url);
      print(LatestMovies.statusCode);
      var json = jsonDecode(LatestMovies.body);
      LatestMovies_response latestMovies_response =
          LatestMovies_response.fromJson(json);
      print('LatestMovies');
      return latestMovies_response;
    } catch (e) {
      rethrow;
    }
  }

//____________________________LatestMovies______________________________________
//   //https://api.themoviedb.org/3/movie/top_rated?api_key=03dc69d016d798b7fb980e9925529385
  static Future<TopRatedMovies_response> getTopRatedMovies() async {
    var url = Uri.https(BASE, '/3/movie/top_rated', {"api_key": APIKEY});
    try {
      Response TopRatedMovies = await http.get(url);
      print(TopRatedMovies.statusCode);
      var json = jsonDecode(TopRatedMovies.body);
      TopRatedMovies_response topRatedMovies_response =
          TopRatedMovies_response.fromJson(json);
      print('TopRatedMovies');
      return topRatedMovies_response;
    } catch (e) {
      throw e;
    }
  }

  //____________________________details______________________________________
  static Future<DetailsData> getDetailsData(int idMovies) async {
    var url = Uri.https(BASE, '/3/movie/$idMovies',
        {"api_key": APIKEY, 'movie_id': '$idMovies'});
    try {
      Response DetailsDataRsponce = await http.get(url);
      print(DetailsDataRsponce.statusCode);
      var json = jsonDecode(DetailsDataRsponce.body);
      DetailsData detailsData = DetailsData.fromJson(json);

      print('DetailsData');
      return detailsData;
    } catch (e) {
      throw e;
    }
  }




  static Future<SimilarMovies> getSimilarMovies(int idMovies) async {
    var url = Uri.https(BASE, '/3/movie/$idMovies/similar',
        {"api_key": APIKEY});
    try {
      Response DetailsSimilarMovies = await http.get(url);
      print(DetailsSimilarMovies.statusCode);
      var json = jsonDecode(DetailsSimilarMovies.body);
      SimilarMovies detailsData = SimilarMovies.fromJson(json);

      print('DetailsData');
      return detailsData;
    } catch (e) {
      throw e;
    }
  }




  static Future<SearchModel> getSearchModel(String search) async {
    var url = Uri.https(BASE, '/3/search/movie',
        {"api_key": APIKEY,
        "query":search,
        });
    try {
      Response SearchModelMovies = await http.get(url);
      print(SearchModelMovies.statusCode);
      var json = jsonDecode(SearchModelMovies.body);
      SearchModel detailsData = SearchModel.fromJson(json);

      print('SearchModelMovies');
      return detailsData;
    } catch (e) {
      throw e;
    }
  }




}
