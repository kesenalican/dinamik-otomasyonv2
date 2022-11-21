// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/service/cari_services.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';

import '../../../styles/colors.dart';

class CariKartlar extends ConsumerStatefulWidget {
  TextEditingController? cariKodController;
  TextEditingController? cariIsmiController;
  bool? detayaGitmesin = false;
  CariKartlar({
    super.key,
    this.detayaGitmesin,
    this.cariKodController,
    this.cariIsmiController,
  });

  @override
  ConsumerState<CariKartlar> createState() => _CariKartlarState();
}

class _CariKartlarState extends ConsumerState<CariKartlar> {
  TextEditingController searchQuery = TextEditingController();
  int currentPage = 0;
  ScrollController scrollController = ScrollController();
  bool hasMore = true;
  bool refresh = false;
  List<Cariler> emptyList = [];
  List<Cariler> fullList = [];
  List<Cariler> searchedList = [];

  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        ref.watch(carilerProvider(currentPage = currentPage + 20));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    handleNext();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // _runFilter(String searchKeyword) {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     setState(() {
  //       fullList = fullList
  //           .where((value) => value.cariKodu
  //               .toLowerCase()
  //               .contains(searchKeyword.toLowerCase()))
  //           .toList();
  //       searchedList = fullList;
  //     });
  //   });
  //   return searchedList;
  // }

  _runFilter(String searchKeyword, CariViewModel cariSearch) {
    // print("YAZILAN DEĞER $searchKeyword");
    // Future<dynamic> a = cariSearch.searchCari(searchKeyword);
    // print("list uzunluğu===" + a.toString());
    Future.delayed(const Duration(seconds: 2), () {
      searchedList = fullList;
      fullList.clear();
      fullList = searchedList
          .where((value) => value.cariKodu
              .toLowerCase()
              .contains(searchKeyword.toLowerCase()))
          .toList();
      setState(() {});
    });
    print("Full listim kaç elemanlı === ${fullList.length}");
    return fullList;
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
        onPressed: () => Navigator.pushNamed(context, "/yeniCariKart"),
        backgroundColor: Color(MyColors.bg01),
        child: const Icon(
          Icons.add,
          size: 25,
        ),
      ),
      resizeToAvoidBottomInset: true,
      appBar: CommonAppbar(
        whichPage: "Cariler",
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
                  child: Text("Hata çıktı ${err.toString()}"),
                );
              },
              loading: () => Center(
                child: CircularProgressIndicator(
                  color: Color(MyColors.bg01),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildCariKart() {
    return ListView.builder(
        itemCount: fullList.length + 1,
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < fullList.length) {
            return InkWell(
              onTap: () {
                if (widget.detayaGitmesin == true) {
                  widget.cariKodController!.text = fullList[index].cariKodu;
                  widget.cariIsmiController!.text =
                      fullList[index].cariUnvani1!;
                  Navigator.pop(
                    context,
                    Cariler(
                      cariKodu: widget.cariKodController!.text,
                      cariUnvani1: widget.cariIsmiController!.text,
                    ),
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
                          child: _buildAdVeKod(index, context),
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
                    ? CircularProgressIndicator(
                        color: Color(MyColors.bg01),
                      )
                    : const Text('Listenin sonuna ulaştınız.'),
              ),
            );
          }
        });
  }

  Column _buildAdVeKod(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fullList[index].cariUnvani1!,
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
          fullList[index].cariKodu,
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

  _buildSearchInput(CariViewModel cariSearch) {
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
              onTap: () {},
              onChanged: (value) => _runFilter(value, cariSearch),
              // onSubmitted: (value) => _runFilter(value),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: Constants.ARA,
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(MyColors.purple01),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
