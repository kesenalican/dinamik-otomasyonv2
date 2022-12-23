import 'package:dinamik_otomasyon/core/constants/api_constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final httpClientProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: ConstantProvider.baseUrl));
});
