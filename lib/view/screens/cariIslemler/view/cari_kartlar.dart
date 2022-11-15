import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/service/cari_services.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/yeniCariKart/yeni_cari_kart.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../styles/colors.dart';
import 'cari_detay.dart';

class CariKartlar extends ConsumerStatefulWidget {
  const CariKartlar({Key? key}) : super(key: key);

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
  List<Cariler> searchedEmptyList = [];

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
  //       searchedEmptyList = fullList;
  //     });
  //   });
  //   return searchedEmptyList;
  // }

  _runFilter(String searchKeyword) {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        searchedEmptyList = fullList;
        fullList.clear();
        fullList = searchedEmptyList
            .where((value) => value.cariKodu
                .toLowerCase()
                .contains(searchKeyword.toLowerCase()))
            .toList();
      });
    });
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const YeniCariKart())),
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
                  width: context.dynamicWidth * 0.03,
                ),
                Expanded(flex: 6, child: _buildSearchInput()),
                const Expanded(
                  flex: 1,
                  child: OpenBarcod(),
                ),
              ],
            ),
            _buildListeleButton(),
            cariListe.when(
              data: (data) {
                currentPage == 0 ? ref.read(carilerProvider(0)) : SizedBox;
                emptyList = data.map((e) => e).toList();
                fullList.addAll(emptyList);
                return RefreshIndicator(
                  onRefresh: handleRefresh,
                  color: Color(MyColors.bg01),
                  child: SizedBox(
                      height: context.dynamicHeight * 0.73,
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
                Navigator.pushNamed(context, '/cariDetay',
                    arguments: fullList[index]);
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
          fullList[index].cariUnvani1,
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

  _buildSearchInput() {
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
              onChanged: (value) => _runFilter(value),
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

  _buildListeleButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: context.dynamicWidth * 0.03,
            vertical: context.dynamicHeight * 0.01),
        padding: context.paddingDefault,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(MyColors.bg01),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(MyColors.bg01),
          ),
        ),
        child: const Center(
          child: Text(
            Constants.HEPSINI_LISTELE,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}


/* 
SizedBox(
          height: context.dynamicHeight * 0.75,
          width: double.infinity,
          child: cariListe.when(
            data: (data) {
              return ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    List cariListe = data.map((e) => e).toList();
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CariDetay(
                              cariList: cariListe[index],
                            ),
                          ),
                        );
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cariListe[index].cariUnvani1,
                                        style: TextStyle(
                                          color: Color(MyColors.bg01),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height:
                                            context.dynamicHeight * 0.01,
                                      ),
                                      Text(
                                        cariListe[index].cariKodu,
                                        style: TextStyle(
                                          color: Color(MyColors.bg01),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
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
        ),
*/