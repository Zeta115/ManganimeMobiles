import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:manganime/models/anime.dart';
import 'package:manganime/models/character.dart';
import 'package:manganime/models/manga.dart';
import 'package:manganime/models/user.dart';
import 'dart:math';

// ---Anime---
Future<List<Anime>> apiAsyncLoadListAnimes(String link) async {
  try {
    final url = Uri.parse(link);
    final futureResponse = await http.get(url);
    if (futureResponse.statusCode != 200) {
      debugPrint("Request failed with ${futureResponse.statusCode}");
    }

    final json = jsonDecode(futureResponse.body);

    final jsonAnimeList = json["data"];

    final List<Anime> animeList = [];

    for (final jsonAnime in jsonAnimeList) {
      final anime = Anime.fromJson(jsonAnime);
      animeList.add(anime);
    }

    debugPrint(animeList.toString());
    return animeList;
  } catch (e) {
    debugPrint(e.toString());
    return [];
  }
}

Future<List<List<Anime>>> apiAsyncLoadAllAnimes() async {
  try {
    final animes1 =
        await apiAsyncLoadListAnimes("https://api.jikan.moe/v4/seasons/now");
    await Future.delayed(
        const Duration(seconds: 2)); // In case it has to wait for api purposes
    final animes2 =
        await apiAsyncLoadListAnimes("https://api.jikan.moe/v4/top/anime");
    await Future.delayed(
        const Duration(seconds: 2)); // In case it has to wait for api purposes

    /*final animes3 = await apiAsyncLoadListAnimes(
      "https://api.jikan.moe/v4/seasons/upcoming",
    );*/

    return [animes1, animes2 /*, animes3*/];
  } catch (e) {
    await Future.delayed(const Duration(seconds: 2));
    debugPrint(e.toString());
    return [];
  }
}

// Manga
Future<List<Manga>> apiAsyncLoadTopMangas() async {
  final url = Uri.parse("https://api.jikan.moe/v4/top/manga");
  final futureResponse = await http.get(url);

  final json = jsonDecode(futureResponse.body);

  final jsonMangaList = json["data"];

  final List<Manga> mangaTop = [];

  for (final jsonManga in jsonMangaList) {
    final manga = Manga.fromJson(jsonManga);
    mangaTop.add(manga);
  }

  debugPrint(mangaTop.toString());
  return mangaTop;
}

//User
Future<List<User2>> apiAsyncLoadUser() async {
  final List<User2> userList = [];

  final randomuserint = Random().nextInt(5) + 1;
  final url =
      Uri.parse("https://api.jikan.moe/v4/characters/$randomuserint/full");

  final futureResponse = await http.get(url);

  final json = jsonDecode(futureResponse.body);
  final jsonUser = json["data"];

  final user = jsonUser != null ? User2.fromJson(jsonUser) : null;

  if (user != null) {
    userList.add(user);
    debugPrint(userList.toString());
  }

  return userList;
}

//Character
Future<List<Character>> apiAsyncLoadTopCharacters() async {
  final url = Uri.parse("https://api.jikan.moe/v4/top/characters");
  final futureResponse = await http.get(url);

  final json = jsonDecode(futureResponse.body);

  final jsonCharacterList = json["data"];

  final List<Character> characterTop = [];

  for (final jsonCharacter in jsonCharacterList) {
    final character = Character.fromJson(jsonCharacter);
    characterTop.add(character);
  }

  debugPrint(characterTop.toString());
  return characterTop;
}
