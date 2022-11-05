import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//#region Users
final usersProvider = FutureProvider.autoDispose<List<UserModel>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get("User");
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<UserModel> userList = mapData.map((e) => UserModel.fromMap(e)).toList();
  return userList;
});
//#endregion

