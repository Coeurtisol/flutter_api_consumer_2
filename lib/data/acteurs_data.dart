import 'dart:convert';
import "package:http/http.dart" as http;

class ActeursData {
  final String authToken = "ac415c926075ad3b5cd2048059e17352";

  Future<Map<String, dynamic>> getPopularActeurs() async {
    var uri = Uri.https("api.themoviedb.org", "3/person/popular",
        {"api_key": authToken, "language": "fr-FR"});
    var response = await http.get(uri);
    // print(uri);
    // print(response);
    Map<String, dynamic> jsonResponse =
        jsonDecode(response.body) as Map<String, dynamic>;
    // print(jsonResponse);
    return jsonResponse;
  }
}
