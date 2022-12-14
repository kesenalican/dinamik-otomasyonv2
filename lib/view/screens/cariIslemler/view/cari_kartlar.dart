import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/irsaliyeIslemleri/service/irsaliye_service.dart';
import 'package:dinamik_otomasyon/view/screens/irsaliyeIslemleri/viewmodel/irsaliye_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/service/cari_services.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';

import '../../../styles/colors.dart';

// ignore: must_be_immutable
class CariKartlar extends ConsumerStatefulWidget {
  final TextEditingController? cariKodController;
  final TextEditingController? cariIsmiController;
  final bool? detayaGitmesin;
  final bool? alisMi;
  final bool? irsaliyeMi;
  const CariKartlar({
    super.key,
    this.detayaGitmesin = false,
    this.cariKodController,
    this.cariIsmiController,
    this.alisMi = false,
    this.irsaliyeMi = false,
  });

  @override
  ConsumerState<CariKartlar> createState() => _CariKartlarState();
}

class _CariKartlarState extends ConsumerState<CariKartlar> {
  TextEditingController searchQuery = TextEditingController();
  int currentPage = 0;
  ScrollController? scrollController;
  bool hasMore = true;
  bool refresh = false;
  List<Cariler> emptyList = [];
  List<Cariler> fullList = [];
  List<Cariler> searchedList = [];
  bool aramaListesiMi = false;

  void handleNext() {
    scrollController!.addListener(() async {
      if (scrollController!.position.maxScrollExtent ==
          scrollController!.position.pixels) {
        ref.watch(carilerProvider(currentPage = currentPage + 20));
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
    handleNext();
  }

  @override
  void dispose() {
    scrollController!.dispose();
    super.dispose();
  }

  dynamic _runFilter(
      int offset, String searchKeyword, CariViewModel cariSearch) {
    print('YAZILAN DE??ER $searchKeyword');
    Future<dynamic> searchedCari =
        cariSearch.searchCari(searchKeyword, searchKeyword);
    return searchedCari;
  }

  @override
  Widget build(BuildContext context) {
    Future<void> handleRefresh() async {
      return await Future.delayed(
        const Duration(seconds: 2),
        () {
          ref.refresh(carilerProvider(currentPage));
          refresh = true;
        },
      );
    }

    var cariListe = ref.watch(carilerProvider(currentPage));
    var cariSearch = ref.watch(cariKayitliMi);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/yeniCariKart'),
        backgroundColor: Color(MyColors.bg01),
        child: const Icon(
          Icons.add,
          size: 25,
        ),
      ),
      resizeToAvoidBottomInset: true,
      appBar: CommonAppbar(
        whichPage: widget.detayaGitmesin! ? ' Cari Se??' : 'Cariler',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: context.dynamicWidth * 0.05,
                ),
                Expanded(flex: 1, child: _buildSearchInput(cariSearch)),
                SizedBox(
                  width: context.dynamicWidth * 0.05,
                ),
              ],
            ),
            // _buildListeleButton(),
            cariListe.when(
              data: (data) {
                currentPage == 0 ? ref.read(carilerProvider(0)) : SizedBox;
                emptyList = data.map((e) => e).toList();
                fullList.addAll(emptyList);
                return RefreshIndicator(
                  onRefresh: handleRefresh,
                  color: Color(MyColors.bg01),
                  child: SizedBox(
                      height: context.dynamicHeight * 0.80,
                      width: double.infinity,
                      child: _buildCariKart()),
                );
              },
              error: (err, stack) {
                return Center(
                  child: Text('Hata ????kt?? ${err.toString()}'),
                );
              },
              loading: () => const CommonLoading(),
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildCariKart() {
    var satisSiparisiCarisi = ref.watch(satisSiparisViewModel);
    var cariViewModel = ref.watch(cariKayitliMi);
    return ListView.builder(
        itemCount: aramaListesiMi
            ? cariViewModel.cariKodSorgula.length + 1
            : fullList.length + 1,
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index <
              (aramaListesiMi
                  ? cariViewModel.cariKodSorgula.length
                  : fullList.length)) {
            return InkWell(
              onTap: () {
                if (widget.detayaGitmesin == true) {
                  satisSiparisiCarisi.saveCariForSiparis(
                    Cariler(
                      cariKodu: fullList[index].cariKodu,
                      cariUnvani1: fullList[index].cariUnvani1,
                      cariBagliStok: fullList[index].cariBagliStok,
                    ),
                  );
                  if (!widget.alisMi!) {
                    satisSiparisiCarisi.alisMi = false;
                  } else if (widget.alisMi! || !widget.irsaliyeMi!) {
                    satisSiparisiCarisi.alisMi = true;
                  } else if (!widget.alisMi! || widget.irsaliyeMi!) {
                    //! SATI?? ??RSAL??YES??
                    var viewModel = ref.watch(irsaliyeViewModel);
                    var siparisKontrol =
                        ref.watch(siparisVarmi(fullList[index].cariKodu));
                    siparisKontrol.hasValue
                        ? viewModel.siparisVarmi = true
                        : false;
                  } else if (widget.alisMi! || widget.irsaliyeMi!) {
                    //! ALI?? ??RSAL??YES??
                  }

                  Navigator.pushNamed<dynamic>(
                    context,
                    '/stockList',
                    arguments: true,
                  );
                } else {
                  Navigator.pushNamed(context, '/cariDetay',
                      arguments: fullList[index]);
                }
              },
              child: Container(
                margin: context.paddingDefault,
                child: Card(
                  elevation: 4,
                  color: Color(MyColors.bg),
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: context.paddingDefault,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(MyColors.bg01),
                        ),
                        SizedBox(
                          width: context.dynamicWidth * 0.03,
                        ),
                        Expanded(
                          flex: 3,
                          child: _buildAdVeKod(index, context, cariViewModel),
                        ),
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
                    : const Text('Listenin sonuna ula??t??n??z.'),
              ),
            );
          }
        });
  }

  Column _buildAdVeKod(
      int index, BuildContext context, CariViewModel cariViewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          aramaListesiMi
              ? cariViewModel.cariKodSorgula[index].cariUnvani1!
              : fullList[index].cariUnvani1!,
          style: TextStyle(
            color: Color(MyColors.bg01),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        SizedBox(
          height: context.dynamicHeight * 0.01,
        ),
        Text(
          aramaListesiMi
              ? cariViewModel.cariKodSorgula[index].cariKodu
              : fullList[index].cariKodu,
          style: TextStyle(
            color: Color(MyColors.bg01),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  dynamic _buildSearchInput(CariViewModel cariSearch) {
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
            child: TextField(
              onChanged: (value) {
                Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    aramaListesiMi = true;
                    _runFilter(currentPage, value, cariSearch);
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
