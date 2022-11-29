import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_button.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/open_barcode.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../styles/colors.dart';

// ignore: must_be_immutable
class StokKartlari extends ConsumerStatefulWidget {
  bool? detayaGitmesin = false;
  StokKartlari({
    super.key,
    this.detayaGitmesin,
    // this.stokKoduController,
    // this.stokIsmiController,
    // this.stokBirimController,
    // this.stokFiyatController,
  });

  @override
  ConsumerState<StokKartlari> createState() => _StokKartlariState();
}

class _StokKartlariState extends ConsumerState<StokKartlari> {
  TextEditingController searchQuery = TextEditingController();
  TextEditingController siparisMiktariController = TextEditingController();
  TextEditingController sipTutariController = TextEditingController();
  TextEditingController stokFiyatiController = TextEditingController();

  static final GlobalKey<FormFieldState<String>> miktarKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> tutarKey =
      GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> fiyatKey =
      GlobalKey<FormFieldState<String>>();
  FocusNode focusNode = FocusNode();
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
    siparisMiktariController = TextEditingController();
    sipTutariController = TextEditingController();
    stokFiyatiController = TextEditingController();
    focusNode = FocusNode();
    handleNext();
  }

  @override
  void dispose() {
    scrollController!.dispose();
    searchQuery.dispose();
    siparisMiktariController.dispose();
    sipTutariController.dispose();
    stokFiyatiController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  // void _runFilter(String query) {
  //   List<Stoklar> dummySearchList = [];
  //   dummySearchList.addAll(fullList);
  //   if (query.isNotEmpty) {
  //     List<Stoklar> dummyListData = [];
  //     for (var stok in dummySearchList) {
  //       var sorgu = stok.stokKodu.toLowerCase();
  //       if (sorgu.contains(query)) {
  //         dummyListData.add(stok);
  //       }
  //     }
  //     setState(() {
  //       searchedEmptyList.clear();
  //       searchedEmptyList.addAll(dummyListData);
  //     });
  //     return;
  //   } else {
  //     setState(() {
  //       searchedEmptyList.clear();
  //       searchedEmptyList.addAll(fullList);
  //     });
  //   }
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
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var siparisStokBilgileri = ref.watch(satisSiparisViewModel);
    return SizedBox(
      height: context.dynamicHeight * 0.90,
      child: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < stokList.length) {
            return InkWell(
              onTap: () {
                if (widget.detayaGitmesin == true) {
                  stokFiyatiController.text =
                      stokList[index].stokFiyat.toString();
                  focusNode.addListener(() {
                    if (siparisMiktariController.text != "") {
                      double miktar =
                          double.parse(siparisMiktariController.text);
                      double fiyat = double.parse(stokFiyatiController.text);
                      double toplam = fiyat * miktar;
                      sipTutariController.text = toplam.toString();
                      setState(() {});
                    }
                  });
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    isDismissible: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Text(
                                "Stok Bilgileri",
                                style: purpleBoldTxtStyle,
                              ),
                              Divider(
                                color: Color(
                                  MyColors.bg01,
                                ),
                                indent: 50,
                                endIndent: 50,
                                thickness: 1,
                              ),
                              //*Stok Kodu
                              Padding(
                                padding: context.paddingDefault,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Stok Kodu:",
                                        style: purpleTxtStyle,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        fullList[index].stokKodu,
                                        style: purpleTxtStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //*Stok Adı
                              Padding(
                                padding: context.paddingDefault,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Stok Adı:",
                                        style: purpleTxtStyle,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        fullList[index].stokIsim,
                                        style: purpleTxtStyle,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //*Stok Fiyatı
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Stok Fiyatı:",
                                      style: purpleTxtStyle,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      // validator: (value) {
                                      //   return siparisStokBilgileri
                                      //       .validateMiktar(value!);
                                      // },
                                      controller: stokFiyatiController,
                                      keyboardType: TextInputType.number,
                                      cursorColor: Color(MyColors.bg01),
                                      style: TextStyle(
                                          color: Color(
                                        MyColors.bg01,
                                      )),
                                      decoration: InputDecoration(
                                        focusedBorder: CommonInputBorder.border,
                                        errorBorder:
                                            CommonInputBorder.errorBorder,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              //*Stok Miktarı
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Miktar Giriniz",
                                      style: purpleTxtStyle,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      validator: (value) {
                                        return siparisStokBilgileri
                                            .validateMiktar(value!);
                                      },
                                      focusNode: focusNode,
                                      controller: siparisMiktariController,
                                      keyboardType: TextInputType.number,
                                      cursorColor: Color(MyColors.bg01),
                                      style: TextStyle(
                                          color: Color(
                                        MyColors.bg01,
                                      )),
                                      decoration: InputDecoration(
                                        focusedBorder: CommonInputBorder.border,
                                        errorBorder:
                                            CommonInputBorder.errorBorder,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: context.dynamicHeight * 0.02,
                              ),
                              //*Toplam Tutar
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Toplam Tutar",
                                        style: purpleTxtStyle,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "${fullList[index].stokFiyat} ${fullList[index].stokKur}",
                                        style: purpleTxtStyle,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: context.dynamicHeight * 0.05,
                              ),
                              InkWell(
                                  onTap: () {
                                    if (!formKey.currentState!.validate()) {
                                      Future.delayed(
                                        const Duration(milliseconds: 500),
                                        () {
                                          return showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Text(
                                                  "Başka bir ürün eklemek istiyor musunuz?",
                                                  style: purpleTxtStyle,
                                                ),
                                                actions: [
                                                  TextButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color(
                                                                  MyColors
                                                                      .bg01)),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .popUntil((route) =>
                                                              route.settings
                                                                  .name ==
                                                              '/cariKartlar');
                                                    },
                                                    child: const Text(
                                                      "Ürün Ekle",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Text(
                                                      "Devam",
                                                      style: purpleTxtStyle,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: CommonButton(buttonName: "EKLE")),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                  siparisStokBilgileri.saveStokForSiparis(
                    Stoklar(
                      stokKodu: stokList[index].stokKodu,
                      stokIsim: stokList[index].stokIsim,
                      stokFiyat: stokList[index].stokFiyat,
                      stokKur: stokList[index].stokKur,
                      stokAnaGrup: stokList[index].stokAnaGrup,
                      stokSektor: stokList[index].stokSektor,
                      stokBirim1: stokList[index].stokBirim1,
                      stokBirim3: stokList[index].stokBirim3,
                      stokBirim3Katsayi: stokList[index].stokBirim3Katsayi,
                      stokReyon: stokList[index].stokReyon,
                      stokMarka: stokList[index].stokMarka,
                      stokModel: stokList[index].stokModel,
                      merkez: stokList[index].merkez,
                      stokMiktar: stokList[index].stokMiktar,
                    ),
                  );
                  // Navigator.pushNamedAndRemoveUntil(context, '/satisSiparisi',
                  //     (route) => route.settings.name == '/home');
                } else {
                  Navigator.pushNamed(context, '/stockDetail',
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
              //onChanged: (value) => _runFilter(value),
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
