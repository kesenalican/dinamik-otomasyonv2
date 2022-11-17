import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//#region Users
final usersProvider = FutureProvider.autoDispose<List<UserModel>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get(ConstantProvider.user);
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<UserModel> userList = mapData.map((e) => UserModel.fromMap(e)).toList();
  return userList;
});
//#endregion

final userCodeProvider = Provider.family((ref, userCode) {
  return userCode.toString();
});

// final userCodeValue = Provider((ref) {
//   var userCode = ref.read<String>(userCodeProvider);
//   return userCode;
// });
