import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manganime/models/anime.dart';
import 'package:manganime/models/manga.dart';

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

Future<List<Manga>> apiAsyncLoadListMangas() async {
  final List<Manga> mangaList = [];

  for (int listado = 1; listado < 3; listado++) {
    final url = Uri.parse("https://api.jikan.moe/v4/manga/$listado/full");

    if (Map<String, dynamic> != Null) {
      final futureResponse = await http.get(url);

      final json = jsonDecode(futureResponse.body);

      final jsonManga = json["data"];

      final manga = Manga.fromJson(jsonManga);
      mangaList.add(manga);

      debugPrint(mangaList.toString());
    }
  }
  return mangaList;
}
