import 'package:list_view_onclik/core/model/user.dart';
import 'dart:convert';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

String responseToJson(Response data) => json.encode(data.toJson());

class Response {
  Response({
    required this.results,
  });

  List<User> results;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        results:
            List<User>.from(json["results"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
