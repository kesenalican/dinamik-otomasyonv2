// import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
// import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
// import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
// import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/stok_detay.dart';
// import 'package:dinamik_otomasyon/view/styles/colors.dart';
// import 'package:flutter/material.dart';

// class SearchStokDelegate extends SearchDelegate {
//   StokService _stokService = StokService();
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = "";
//           },
//           icon: const Icon(Icons.close)),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         icon: Icon(Icons.arrow_back_ios));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Container(
//       child: FutureBuilder(
//         future: _stokService.getUserListforSearch(query),
//         builder: (context, snapshot) {
//           var data = snapshot.data;
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: Color(MyColors.bg01),
//               ),
//             );
//           }
//           return ListView.builder(
//             itemCount: data?.length,
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => StokDetay(
//                                 stokModel: data[index],
//                               )));
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.all(5),
//                   child: Card(
//                     elevation: 4,
//                     color: Color(MyColors.bg),
//                     margin: EdgeInsets.zero,
//                     child: Padding(
//                       padding: EdgeInsets.all(context.dynamicHeight * 0.01),
//                       child: Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundColor: Color(MyColors.bg01),
//                           ),
//                           SizedBox(
//                             width: context.dynamicWidth * 0.01,
//                           ),
//                           _buildKodVeAd(data!, index, context),
//                           SizedBox(
//                             width: context.dynamicWidth * 0.10,
//                           ),
//                           //FİYAT
//                           _buildAdetVeFiyat(context, data, index),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   Expanded _buildKodVeAd(List<Stoklar> liste, int index, BuildContext context) {
//     return Expanded(
//       flex: 9,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             liste[index].stokIsim,
//             style: TextStyle(
//               color: Color(MyColors.bg01),
//               fontWeight: FontWeight.w600,
//               fontSize: 12,
//             ),
//             overflow: TextOverflow.ellipsis,
//             maxLines: 2,
//           ),
//           SizedBox(
//             height: context.dynamicHeight * 0.01,
//           ),
//           Text(
//             liste[index].stokKodu,
//             style: TextStyle(
//               color: Color(MyColors.bg01),
//               fontSize: 10,
//               fontWeight: FontWeight.w600,
//             ),
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     );
//   }

//   Expanded _buildAdetVeFiyat(
//       BuildContext context, List<Stoklar> liste, int index) {
//     return Expanded(
//       flex: 2,
//       child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(context.dynamicHeight * 0.006),
//             child: Text(
//               "Adet: ${liste[index].stokFiyat.ceil().toString()}",
//               style: TextStyle(
//                 color: Color(MyColors.bg01),
//                 fontSize: 10,
//                 fontWeight: FontWeight.w600,
//               ),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Text(
//             "${liste[index].stokFiyat.toString()} TL",
//             style: TextStyle(
//               color: Color(MyColors.bg01),
//               fontSize: 10,
//               fontWeight: FontWeight.w600,
//             ),
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return const Center(
//       child: Text("Ürün Ara"),
//     );
//   }
// }
