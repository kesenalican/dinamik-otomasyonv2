import 'package:flutter/foundation.dart';

import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';

class StokPagination {
  final List<Stoklar> stoklar;
  final int page;
  final String errorMessage;
  StokPagination({
    required this.stoklar,
    required this.page,
    required this.errorMessage,
  });

  StokPagination.initial()
      : stoklar = [],
        page = 1,
        errorMessage = '';

  bool get refreshError => errorMessage != '' && stoklar.length <= 20;

  StokPagination copyWith({
    List<Stoklar>? stoklar,
    int? page,
    String? errorMessage,
  }) {
    return StokPagination(
      stoklar: stoklar ?? this.stoklar,
      page: page ?? this.page,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      'StokPagination(stoklar: $stoklar, page: $page, errorMessage: $errorMessage)';

  @override
  bool operator ==(covariant StokPagination other) {
    if (identical(this, other)) return true;

    return listEquals(other.stoklar, stoklar) &&
        other.page == page &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => stoklar.hashCode ^ page.hashCode ^ errorMessage.hashCode;
}
