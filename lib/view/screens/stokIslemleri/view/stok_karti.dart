import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/open_barcode.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/stok_detay.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../styles/colors.dart';

class StokKartlari extends ConsumerStatefulWidget {
  const StokKartlari({super.key});

  @override
  ConsumerState<StokKartlari> createState() => _StokKartlariState();
}

class _StokKartlariState extends ConsumerState<StokKartlari> {
  TextEditingController searchQuery = TextEditingController();
  int currentPage = 0;
  ScrollController? scrollController;
  bool hasMore = true;
  List<Stoklar> emptyList = [];
  List<Stoklar> fullList = [];
  List<Stoklar> searchedEmptyList = [];
  bool searchFilter = false;

  void handleNext() {
    scrollController!.addListener(() async {
      if (scrollController!.position.maxScrollExtent ==
          scrollController!.position.pixels) {
        ref.watch(stoklarProvider(currentPage = currentPage + 20));
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
    searchQuery.dispose();
    super.dispose();
  }

  void _runFilter(String query) {
    List<Stoklar> dummySearchList = [];
    dummySearchList.addAll(fullList);
    if (query.isNotEmpty) {
      List<Stoklar> dummyListData = [];
      for (var stok in dummySearchList) {
        var sorgu = stok.stokKodu.toLowerCase();
        if (sorgu.contains(query)) {
          dummyListData.add(stok);
        }
      }
      setState(() {
        searchedEmptyList.clear();
        searchedEmptyList.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        searchedEmptyList.clear();
        searchedEmptyList.addAll(fullList);
      });
    }
    print("DUMMY LİST LENGTH" + searchedEmptyList.length.toString());
  }

  // _runFilter(String searchQuery) async {
  //   Future.delayed(
  //     const Duration(seconds: 2),
  //     () {
  //       setState(() {
  //         searchFilter == true;
  //         searchedEmptyList = fullList;
  //         fullList.clear();
  //         fullList = searchedEmptyList
  //             .where((value) => value.stokIsim
  //                 .toLowerCase()
  //                 .contains(searchQuery.toLowerCase()))
  //             .toList();
  //       });
  //     },
  //   );
  //   print("aramadan sonra fulllist == " + fullList.length.toString());

  //   return fullList;
  // }

  // _runFilter(String searchKeyword) {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     setState(() {
  //       searchedEmptyList = fullList
  //           .where((value) => value.stokKodu
  //               .toLowerCase()
  //               .contains(searchKeyword.toLowerCase()))
  //           .toList();
  //       fullList.clear();
  //     });
  //   });
  //   return searchedEmptyList;
  // }

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

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CommonAppbar(
        whichPage: "Stoklar",
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
                    child: Text("Hata çıktı ${err.toString()}"),
                  );
                },
                loading: () => const CommonLoading()),
          ],
        ),
      ),
    );
  }

  SizedBox _buildStokKarti(List<Stoklar> stokList) {
    return SizedBox(
      height: context.dynamicHeight * 0.75,
      child: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < stokList.length) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StokDetay(
                      stokModel: stokList[index],
                    ),
                  ),
                );
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
                        CircleAvatar(
                          backgroundColor: Color(MyColors.bg01),
                        ),
                        SizedBox(
                          width: context.dynamicWidth * 0.01,
                        ),
                        _buildKodVeAd(index, stokList),
                        SizedBox(
                          width: context.dynamicWidth * 0.10,
                        ),
                        //FİYAT
                        _buildAdetVeFiyat(index, stokList)
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
        },
        itemCount: fullList.length + 1,
      ),
    );
  }

  Expanded _buildAdetVeFiyat(int index, List<Stoklar> stokList) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(context.dynamicHeight * 0.006),
            child: Text(
              "Adet: ${stokList[index].stokFiyat.ceil().toString()}",
              style: TextStyle(
                color: Color(MyColors.bg01),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "${stokList[index].stokFiyat.toString()} TL",
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

  Expanded _buildKodVeAd(int index, List<Stoklar> stokList) {
    return Expanded(
      flex: 9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stokList[index].stokIsim,
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
            stokList[index].stokKodu,
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
              onChanged: (value) => _runFilter(value),
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
