import 'package:list_view_onclik/core/model/user.dart';
import 'package:list_view_onclik/core/res/reponse.dart';
import 'package:list_view_onclik/core/service/network.dart';

class Repository extends Network {
  Repository();

  Repository._privateConstructor();
  static final Repository _instance = Repository._privateConstructor();

  static Repository get instance => _instance;

  Future<List<User>> getUser() async {
    var map = await methodGet();
    return Response.fromJson(map).results;
  }
}
