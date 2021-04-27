import 'package:flutter/cupertino.dart';
import 'package:tugas_crud/model/user.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class UserApiService {

  Client client = Client();

  Future<List<User>> getUsers() async {
    final response = await client.get("http://192.168.43.18/ci4/public/index.php/user");
    if (response.statusCode == 200) {
      return userFromJson(response.body);
    } else {
      return [];
    }
  }

  Future<bool> createUser(User data) async {
    final response = await client.post(
      "http://192.168.43.18/ci4/public/index.php/user/create",
      body: {
        "fullname" : data.fullName,
        "grade" : data.grade,
        "gender" : data.gender,
        "phone" : data.phone 
      }
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<User> getUserBy(int id) async {
    final response = await client.get("http://192.168.43.18/ci4/public/index.php/user/getUserBy/$id");
    if (response.statusCode == 200) {
      final data = User.fromJson(json.decode(response.body));
      return data;
    } else {
      return null;
    }
  }

  Future<bool> updateUser({int id, User data}) async {
    final response = await client.post(
      "http://192.168.43.18/ci4/public/index.php/user/update/$id",
      body: {
        "fullname" : data.fullName,
        "grade" : data.grade,
        "gender" : data.gender,
        "phone" : data.phone 
      }
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> deleteUser({int id}) async {
    // ganti dengan method get juga gpph
    final response = await client.delete(
      "http://192.168.43.18/ci4/public/index.php/user/delete/$id"
    );
    if (response.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }

}