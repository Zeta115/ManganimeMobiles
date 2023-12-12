import 'dart:convert'; 
import 'package:http/http.dart' as http;

void apiLoadAnimeInfo()
{
    final Uri url = Uri.parse("https://randomuser.me/api/?results=50");
    final Future futureResponse = http.get(url);
    
    futureResponse.then((value) {
    final json = jsonDecode(value.body);

    final jsonUserList =
        json["results"]; // s'ha de mirar en cada api en quin format ho retorna

  });
}