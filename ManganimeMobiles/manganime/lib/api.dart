import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manganime/models/anime.dart';
import 'package:manganime/models/manga.dart';
import 'package:manganime/models/user.dart';

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

  debugPrint(animeList.toString());
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

  debugPrint(animeTop.toString());
  return animeTop;
}

// Manga
Future<List<Manga>> apiAsyncLoadListMangas() async {
  final List<Manga> mangaList = [];

  for (int listado = 1; listado < 10; listado++) {
    final url = Uri.parse("https://api.jikan.moe/v4/manga/$listado/full");
    final futureResponse = await http.get(url);

    final json = jsonDecode(futureResponse.body);
    final jsonManga = json["data"];

    final manga = jsonManga != null ? Manga.fromJson(jsonManga) : null;

    if (manga != null) {
      mangaList.add(manga);
      debugPrint(mangaList.toString());
    } else {
      listado = listado++;
    }
  }

  return mangaList;
}

Future<List<User>> apiAsyncLoadUser() async {
  final List<User> userList = [];

  final url = Uri.parse("https://api.jikan.moe/v4/characters/5/full");
  final futureResponse = await http.get(url);

  final json = jsonDecode(futureResponse.body);
  final jsonUser = json["data"];

  final user = jsonUser != null ? User.fromJson(jsonUser) : null;

  if (user != null) {
    userList.add(user);
    debugPrint(userList.toString());
  }

  return userList;
}
