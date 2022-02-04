import 'dart:convert';
import 'package:http/http.dart' as http;

class Network {
  final String baseUrl = 'https://randomuser.me/api/?results=100';

  Future<dynamic> methodGet() async {
    var response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var item = json.decode(response.body);
      print(item);
      return item;
    } else {
      print('not connected to rest api');
    }
  }
}
