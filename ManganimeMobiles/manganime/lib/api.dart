import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manganime/models/anime.dart';
import 'package:manganime/models/manga.dart';

// ---Anime---
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

  //debugPrint(animeList.toString());
  return animeList;
}

Future<List<Anime>> apiAsyncLoadTopAnimes() async {
  final url = Uri.parse("https://api.jikan.moe/v4/top/anime");
  final futureResponse = await http.get(url);

  final json = jsonDecode(futureResponse.body);

  final jsonAnimeList = json["data"];

  final List<Anime> animeTop = [];

  for (final jsonAnime in jsonAnimeList) {
    final anime = Anime.fromJson(jsonAnime);
    animeTop.add(anime);
  }

  debugPrint("animeTop.length.toString()");
  debugPrint(animeTop.length.toString());
  debugPrint(animeTop.toString());
  return animeTop;
}

// ---Manga---
Future<List<Manga>> apiAsyncLoadListMangas() async {
  final List<Manga> mangaList = [];

  for (int listado = 1; listado < 150; listado++) {
    final url = Uri.parse("https://api.jikan.moe/v4/manga/$listado/full");
    final futureResponse = await http.get(url);

    final json = jsonDecode(futureResponse.body);
    final jsonManga = json["data"];

    // Verificar si jsonManga es nulo antes de intentar crear el objeto Manga
    final manga = jsonManga != null ? Manga.fromJson(jsonManga) : null;

// Hay muchas entradas con chapters=null asi que solo voy a comprobar que la entrada existe
    if (manga != null) {
      mangaList.add(manga);
      debugPrint(mangaList.toString());
    } else {
      listado = listado++;
    }
  }

  return mangaList;
}
