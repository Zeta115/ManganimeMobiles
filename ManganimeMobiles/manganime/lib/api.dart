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
  final url = Uri.parse("https://api.jikan.moe/v4/manga/{id}/full");
  final futureResponse = await http.get(url);

  final json = jsonDecode(futureResponse.body);

  final jsonMangaList = json["data"];

  final List<Manga> mangaList = [];

  for (final jsonManga in jsonMangaList) {
    final manga = Manga.fromJson(jsonManga);
    mangaList.add(manga);
  }

  debugPrint(mangaList.toString());
  return mangaList;
}
