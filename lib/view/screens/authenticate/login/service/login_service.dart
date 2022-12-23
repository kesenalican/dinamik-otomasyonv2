import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/core/components/dialog_utils.dart';
import 'package:dinamik_otomasyon/core/constants/api_constant.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//#region Users
final usersProvider = FutureProvider.autoDispose<List<UserModel>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  List<UserModel> userList = [];
  final result = await dio.get(ConstantProvider.user,options:Options(
    sendTimeout: 1000
  ) );
  
  if (result.statusCode == 200) {
    List<Map<String, dynamic>> mapData = List.from(result.data);
    userList = mapData.map((e) => UserModel.fromMap(e)).toList();
    return userList;
  } else {
    return showToast('Kullanıcılar getirilirken bir hata oluştu!');
  }
});
//#endregion

final userCodeProvider = Provider.family((ref, userCode) {
  return userCode.toString();
});

// final userCodeValue = Provider((ref) {
//   var userCode = ref.read<String>(userCodeProvider);
//   return userCode;
// });
