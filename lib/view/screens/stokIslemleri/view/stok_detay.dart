import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/tabs/stok_depo_tab.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/tabs/stok_fiyatlar_tab.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/tabs/stok_raporlar_tab.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/constant.dart';
import '../../../styles/colors.dart';
import 'tabs/stok_genel_tab.dart';

class StokDetay extends StatefulWidget {
  final Stoklar stokModel;

  const StokDetay({Key? key, required this.stokModel}) : super(key: key);

  @override
  State<StokDetay> createState() => _StokDetayState();
}

class _StokDetayState extends State<StokDetay> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            Constants.stokDetay,
            style: TextStyle(
                color: Color(MyColors.bg), fontWeight: FontWeight.w600),
          ),
          iconTheme: IconThemeData(color: Color(MyColors.bg01)),
          backgroundColor: Color(MyColors.bg01),
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.info_outline),
                text: Constants.genel,
              ),
              Tab(
                icon: Icon(Icons.price_change_rounded),
                text: Constants.fiyatlar,
              ),
              Tab(
                icon: Icon(Icons.warehouse),
                text: Constants.depo,
              ),
              Tab(
                icon: Icon(Icons.report_gmailerrorred),
                text: Constants.raporlar,
              ),
              Tab(
                icon: Icon(Icons.auto_graph),
                text: Constants.grafikler,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //Genel Tab
            StokGenel(
              stokModel: widget.stokModel,
            ),
            // Fiyat Tab
            FiyatlarTab(
              stokModel: widget.stokModel,
            ),
            //Depo Tab
            DepoTab(
              stokModel: widget.stokModel,
            ),
            // RaporlarTab
            RaporlarTab(
              stokModel: widget.stokModel,
            ),
            const Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
