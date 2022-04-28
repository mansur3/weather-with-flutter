
import 'package:http/http.dart'as http;
import 'dart:convert';


class Network {
  final String? url;
  Network({this.url});

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url!));
    if(response.statusCode == 200) {
      final jsonData = response.body;
      final decodedData = jsonDecode(jsonData);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}