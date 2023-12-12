import 'dart:convert'; 
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manganime/models/anime.dart';

Future<List<Anime>> apiAsyncLoadAnimes() async {
  final url = Uri.parse("https://api.jikan.moe/v4/anime/21");
  final futureResponse = await http.get(url);

  final json = jsonDecode(futureResponse.body);

  final jsonAnimeList =
      json["data"]; // s'ha de mirar en cada api en quin format ho retorna

  final List<Anime> animeList = [];

  for (final jsonAnime in jsonAnimeList) {
    final anime = Anime.fromJson(jsonAnime);
    animeList.add(anime);
  }

  debugPrint(animeList.toString());
  return animeList;
}
