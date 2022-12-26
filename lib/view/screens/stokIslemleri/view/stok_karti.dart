import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/core/routing/route_constants.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/urun_bilgileri_gir.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/viewmodel/stok_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../styles/colors.dart';

class StokKartlari extends ConsumerStatefulWidget {
  final bool? detayaGitmesin;
  const StokKartlari({
    super.key,
    this.detayaGitmesin = false,
  });

  @override
  ConsumerState<StokKartlari> createState() => _StokKartlariState();
}

class _StokKartlariState extends ConsumerState<StokKartlari> {
  TextEditingController searchQuery = TextEditingController();

  FocusNode focusNode = FocusNode();
  int currentPage = 0;
  ScrollController? scrollController;
  bool hasMore = true;
  List<Stoklar> emptyList = [];
  List<Stoklar> fullList = [];
  List<Stoklar> searchedEmptyList = [];
  bool searchFilter = false;
  String _barcodeData = '';
  AsyncValue<List<Stoklar>>? barcodeScanner;
  bool aramaListesiMi = false;
  void handleNext() {
    scrollController!.addListener(() async {
      if (scrollController!.position.maxScrollExtent ==
          scrollController!.position.pixels) {
        ref.watch(stoklarProvider(currentPage = currentPage + 20));
      } else {
        setState(() {
          hasMore = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    focusNode = FocusNode();
    handleNext();
  }

  @override
  void dispose() {
    scrollController!.dispose();
    searchQuery.dispose();
    focusNode.dispose();
    super.dispose();
  }

  dynamic _runFilter(
      int offset, String searchKeyword, StokViewModel stokViewModel) {
    Future<dynamic> searchStok =
        stokViewModel.searchStok(currentPage, searchKeyword, searchKeyword);
    return searchStok;
  }

  @override
  Widget build(BuildContext context) {
    Future<void> handleRefresh() async {
      return await Future.delayed(
        const Duration(seconds: 2),
        () {
          ref.refresh(stoklarProvider(currentPage));
        },
      );
    }

    var liste = ref.watch(stoklarProvider(currentPage));
    var stokViewModel = ref.watch(stokViewModelProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CommonAppbar(
        whichPage:
            widget.detayaGitmesin! ? Constants.urunSec : Constants.stoklar,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: context.dynamicWidth * 0.03,
                ),
                Expanded(flex: 6, child: _buildSearchInput(stokViewModel)),
                Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () async {
                        await FlutterBarcodeScanner.scanBarcode(
                                '#000000', 'Geri', true, ScanMode.BARCODE)
                            .then((value) => setState(() {
                                  _barcodeData = value;
                                  stokViewModel
                                      .getStockWithBarcode(
                                          _barcodeData, context)
                                      .then((value) {
                                    if (stokViewModel.stokModel!.isEmpty) {
                                      return showAlertDialog(
                                        context: context,
                                        hataBaslik: Constants.hataliBarkod,
                                        hataIcerik:
                                            Constants.boyleBirBarkodBulunamadi,
                                      );
                                    } else {
                                      Navigator.pushNamed(
                                        context,
                                        RouteConstants.stockDetail,
                                        arguments: stokViewModel.stokModel![0],
                                      );
                                    }
                                  });
                                }));
                      },
                      icon: Icon(
                        Icons.qr_code,
                        color: Color(MyColors.bg01),
                      )),
                ),
              ],
            ),
            // _buildListeleButton(),
            liste.when(
                data: (data) {
                  emptyList = data.map((e) => e).toList();
                  fullList.addAll(emptyList);
                  searchFilter ? fullList.clear() : null;
                  return RefreshIndicator(
                      onRefresh: handleRefresh,
                      color: Color(MyColors.bg01),
                      child: _buildStokKarti(fullList));
                },
                error: (err, stack) {
                  return Center(
                    child: Text('${Constants.hataCikti} ${err.toString()}'),
                  );
                },
                loading: () => const CommonLoading()),
          ],
        ),
      ),
    );
  }

  SizedBox _buildStokKarti(List<Stoklar> stokList) {
    var siparisModel = ref.watch(satisSiparisViewModel);
    var stokViewModel = ref.watch(stokViewModelProvider);
    return SizedBox(
      height: context.dynamicHeight * 0.90,
      child: ListView.builder(
        itemCount: aramaListesiMi
            ? stokViewModel.searchedStok.length + 1
            : fullList.length + 1,
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index <
              (aramaListesiMi
                  ? stokViewModel.searchedStok.length
                  : stokList.length)) {
            return InkWell(
              onTap: () {
                if (widget.detayaGitmesin == true) {
                  siparisModel.saveStokForSiparis(
                    Stoklar(
                      barkodu: fullList[index].barkodu,
                      stokKodu: fullList[index].stokKodu,
                      stokIsim: fullList[index].stokIsim,
                      stokFiyat: fullList[index].stokFiyat,
                      stokKur: fullList[index].stokKur,
                      stokAnaGrup: fullList[index].stokAnaGrup,
                      stokSektor: fullList[index].stokSektor,
                      stokBirim1: fullList[index].stokBirim1,
                      stokBirim3: fullList[index].stokBirim3,
                      stokBirim3Katsayi: fullList[index].stokBirim3Katsayi,
                      stokReyon: fullList[index].stokReyon,
                      stokMarka: fullList[index].stokMarka,
                      stokModel: fullList[index].stokModel,
                      merkez: fullList[index].merkez,
                      stokMiktar: fullList[index].stokMiktar,
                      perakendeVergiIsim: fullList[index].perakendeVergiIsim,
                      perakendeVergiYuzde: fullList[index].perakendeVergiYuzde,
                      toptanVergiIsim: fullList[index].toptanVergiIsim,
                      toptanVergiYuzde: fullList[index].toptanVergiYuzde,
                    ),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UrunBilgileriGir(
                                alisSiparisi: false,
                              )));
                } else {
                  Navigator.pushNamed(context, RouteConstants.stockDetail,
                      arguments: stokList[index]);
                }
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Card(
                  elevation: 4,
                  color: Color(MyColors.bg),
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: EdgeInsets.all(context.dynamicHeight * 0.01),
                    child: Row(
                      children: [
                        SizedBox(
                          width: context.dynamicWidth * 0.01,
                        ),
                        _buildKodVeAd(index, stokList, stokViewModel),
                        _buildKDV(index),
                        //*FİYAT
                        _buildAdetVeFiyat(index, stokList, stokViewModel),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Padding(
              padding: context.paddingDefault,
              child: Center(
                child: hasMore
                    ? const CommonLoading()
                    : const Text(Constants.listeSonunaUlastiniz),
              ),
            );
          }
        },
      ),
    );
  }

  Expanded _buildKDV(int index) {
    return Expanded(
        flex: 2,
        child: Text(
          fullList[index].perakendeVergiIsim,
          style: purpleTxtStyle.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ));
  }

  Expanded _buildAdetVeFiyat(
      int index, List<Stoklar> stokList, StokViewModel stokViewModel) {
    var fiyat = stokList[index].stokFiyat;
    var truncateFiyat = fiyat.toStringAsFixed(2);
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(context.dynamicHeight * 0.006),
            child: Text(
              aramaListesiMi
                  ? '${Constants.adet}: ${stokViewModel.searchedStok[index].stokMiktar.ceil().toString()}'
                  : '${Constants.adet}: ${stokList[index].stokMiktar.ceil().toString()}',
              style: TextStyle(
                color: Color(MyColors.bg01),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            aramaListesiMi
                ? '${stokViewModel.searchedStok[index].stokFiyat.toStringAsFixed(2)} ${CurrencyConstants.tl}'
                : '$truncateFiyat ${CurrencyConstants.tl}',
            style: TextStyle(
              color: Color(MyColors.bg01),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Expanded _buildKodVeAd(
      int index, List<Stoklar> stokList, StokViewModel stokViewModel) {
    return Expanded(
      flex: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            aramaListesiMi
                ? stokViewModel.searchedStok[index].stokIsim
                : stokList[index].stokIsim,
            style: TextStyle(
              color: Color(MyColors.bg01),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(
            height: context.dynamicHeight * 0.01,
          ),
          Text(
            aramaListesiMi
                ? stokViewModel.searchedStok[index].stokKodu
                : stokList[index].stokKodu,
            style: TextStyle(
              color: Color(MyColors.bg01),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  _buildSearchInput(StokViewModel stokViewModel) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.bg),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(MyColors.bg01),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Color(MyColors.purple02),
          ),
          SizedBox(
            width: context.dynamicWidth * 0.02,
          ),
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                Future.delayed(
                  const Duration(milliseconds: 500),
                  () {
                    aramaListesiMi = true;
                    _runFilter(currentPage, value, stokViewModel);
                    if (value.isEmpty) {
                      aramaListesiMi = false;
                    }
                  },
                );
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: Constants.ara,
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(MyColors.purple01),
                    fontWeight: FontWeight.w700),
              ),
              style: purpleTxtStyle,
            ),
          ),
        ],
      ),
    );
  }
}
