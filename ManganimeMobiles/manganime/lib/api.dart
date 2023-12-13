import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manganime/models/anime.dart';

Future<List<Anime>> apiAsyncLoadListAnimes() async {
  final url = Uri.parse("https://api.jikan.moe/v4/seasons/now");
  final futureResponse = await http.get(url);

  final json = jsonDecode(futureResponse.body);

  final jsonAnimeList = json["data"];

  final List<Anime> animeList = [];

  for (final jsonAnime in jsonAnimeList) {
    final anime = Anime.fromJson(jsonAnime);
    animeList.add(anime);
  }

  debugPrint(animeList.toString());
  return animeList;
}

Future<Anime> apiAsyncLoadAnime(int id) async {
  final url = Uri.parse("https://api.jikan.moe/v4/anime/$id}");
  final futureResponse = await http.get(url);

  final json = jsonDecode(futureResponse.body);

  final anime = json["data"];

  debugPrint(anime.toString());
  return anime;
}
