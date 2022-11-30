import 'package:dinamik_otomasyon/Model/firma_model.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/service/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/model/user_model.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/service/login_service.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/view/user_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/viewmodel/login_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  bool remember = false;
  bool isChecked = false;
  late TextEditingController companyController;
  late TextEditingController userController;
  late TextEditingController passwordController;
  late TextEditingController userCodeController;

  @override
  void initState() {
    super.initState();
    companyController = TextEditingController();
    userController = TextEditingController();
    passwordController = TextEditingController();
    userCodeController = TextEditingController();
    loadLoginInfo();
  }

  void loadLoginInfo() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var company = prefs.getString("company_name") ?? "";
      var user = prefs.getString("user_name") ?? "";
      var password = prefs.getString("password") ?? "";
      var userCode = prefs.getString("user_code") ?? "";
      remember = prefs.getBool("remember_me")!;
      setState(() {
        remember = true;
        companyController.text = company;
        userController.text = user;
        passwordController.text = password;
        userCodeController.text = userCode;
      });
    } catch (e) {
      Future.delayed(const Duration(milliseconds: 500), () {
        return showAlertDialog(
            context: context,
            hataBaslik: Constants.sharedHatasi,
            hataIcerik: Constants.sharedHataIcerik + e.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentUser = ref.watch(currentUserProvider);
    var firmaList = ref.watch(firmaProvider);
    var userList = ref.watch(usersProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          color: Color(MyColors.primary),
          height: context.dynamicHeight,
          width: context.dynamicWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              Expanded(
                  flex: 4,
                  child: _buildLogo(
                      context, context.dynamicHeight, context.dynamicWidth)),
              const Spacer(),
              Expanded(
                flex: 1,
                child: firmaList.when(
                  loading: () => const CommonLoading(),
                  error: (error, stackTrace) => showAlertDialog(
                      context: context,
                      hataBaslik: Constants.HATA_BASLIK,
                      hataIcerik: Constants.HATA_ICERIK),
                  data: (data) {
                    List<FirmaModel> firmaList = data.map((e) => e).toList();
                    return _buildFirmaField(
                      firmalist: firmaList,
                      companyController: companyController,
                      context: context,
                      dynamicHeight: context.dynamicHeight,
                      dynamicWidth: context.dynamicWidth,
                      hint: Constants.SIRKET_ADI,
                      prefixIcon: Icons.account_balance,
                      suffixIcon: Icons.replay_rounded,
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: userList.when(
                  loading: () => const CommonLoading(),
                  error: (error, stackTrace) => showAlertDialog(
                      context: context,
                      hataBaslik: Constants.HATA_BASLIK,
                      hataIcerik: Constants.HATA_ICERIK),
                  data: (data) {
                    List<UserModel> userList = data.map((e) => e).toList();
                    return UserTextField(
                      userController: userController,
                      userCodeController: userCodeController,
                      userNameController: userController,
                      userList: userList,
                      hint: Constants.KULLANICI_ADI,
                      prefixIcon: Icons.person,
                      suffixIcon: Icons.replay_rounded,
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: _buildPasswordField(
                  context: context,
                  dynamicHeight: context.dynamicHeight,
                  dynamicWidth: context.dynamicWidth,
                  hint: Constants.SIFRE,
                  passwordController: passwordController,
                  prefixIcon: Icons.password,
                ),
              ),
              Expanded(
                child: CheckboxListTile(
                  checkColor: Color(
                    MyColors.bg01,
                  ),
                  activeColor: Colors.white,
                  value: remember,
                  onChanged: buildRememberMeShared,
                  title: const Text(
                    Constants.BENI_HATIRLA,
                    style: TextStyle(color: Colors.white),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () async {
                    if (userController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty &&
                        companyController.text.isNotEmpty &&
                        passwordController.text == Constants.password) {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          // showAlertDialog(
                          //     context: context,
                          //     hataBaslik: companyController.text,
                          //     hataIcerik: Constants.hosGeldiniz);
                        },
                      );

                      currentUser.setCurrentUser(UserModel(
                          kullaniciNo: int.parse(userCodeController.text),
                          kullaniciKisaAdi: userController.text,
                          kullaniciUzunAdi: userCodeController.text,
                          kullaniciAdi: userController.text));

                      Navigator.pushReplacementNamed(context, '/home',
                          arguments: companyController.text);
                    } else if (passwordController.text != Constants.password) {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          showAlertDialog(
                              context: context,
                              hataBaslik: Constants.sifreYanlis,
                              hataIcerik: Constants.sifreYanlis2);
                        },
                      );
                    } else {
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          showAlertDialog(
                              context: context,
                              hataBaslik: Constants.girisHatasi,
                              hataIcerik: Constants.girisHatasi2);
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.dynamicWidth * 0.15,
                        vertical: context.dynamicHeight * 0.02),
                    shape: const StadiumBorder(),
                    backgroundColor: Color(MyColors.header01),
                    elevation: 8,
                    shadowColor: Colors.black87,
                  ),
                  child: const Text(
                    Constants.GIRIS_YAP,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  void buildRememberMeShared(bool? value) async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("remember_me", value!);
      prefs.setString("company_name", companyController.text);
      prefs.setString("user_name", userController.text);
      prefs.setString("user_code", userCodeController.text);
      prefs.setString("password", passwordController.text);
    });
    setState(() {
      remember = value!;
    });
  }
}

// ignore: must_be_immutable

_buildFirmaField({
  List<FirmaModel>? firmalist,
  TextEditingController? companyController,
  double? dynamicHeight,
  double? dynamicWidth,
  context,
  String? hint,
  IconData? prefixIcon,
  IconData? suffixIcon,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: dynamicWidth! * 0.02, vertical: dynamicHeight! * 0.001),
    child: Form(
      child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          child: TextFormField(
            readOnly: true,
            controller: companyController,
            textAlignVertical: TextAlignVertical.bottom,
            cursorColor: Color(MyColors.bg01),
            style: TextStyle(
              color: Color(
                MyColors.bg01,
              ),
              fontSize: 12,
            ),
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: 15,
                color: Color(
                  MyColors.bg01,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              focusColor: Color(MyColors.primary),
              prefixIcon: Icon(
                prefixIcon,
                color: Color(
                  MyColors.bg01,
                ),
              ),
              suffix: InkWell(
                  onTap: () {
                    showFirmalar(context, firmalist!, companyController!,
                        dynamicHeight, dynamicWidth);
                  },
                  child: Icon(
                    suffixIcon,
                    color: Color(
                      MyColors.bg01,
                    ),
                  )),
            ),
          )),
    ),
  );
}

_buildPasswordField({
  TextEditingController? passwordController,
  double? dynamicHeight,
  double? dynamicWidth,
  context,
  String? hint,
  IconData? prefixIcon,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: dynamicWidth! * 0.02, vertical: dynamicHeight! * 0.002),
    child: Form(
        child: Material(
      elevation: 8,
      shadowColor: Colors.black87,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          controller: passwordController,
          textAlignVertical: TextAlignVertical.bottom,
          cursorColor: Color(MyColors.bg01),
          keyboardType: TextInputType.visiblePassword,
          style: TextStyle(
            color: Color(
              MyColors.bg01,
            ),
            fontSize: 15,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontSize: 15,
              color: Color(
                MyColors.bg01,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            focusColor: Color(MyColors.primary),
            prefixIcon: Icon(
              prefixIcon,
              color: Color(
                MyColors.bg01,
              ),
            ),
          )),
    )),
  );
}

showFirmalar(
    context,
    List<FirmaModel> list,
    TextEditingController companyController,
    double dynamicHeight,
    double dynamicWidth) {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text(
          Constants.firmaSeciniz,
          style: purpleBoldTxtStyle,
        ),
        children: [
          SizedBox(
            height: dynamicHeight * 0.4,
            width: dynamicWidth * 0.5,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SimpleDialogOption(
                  onPressed: () {
                    companyController.text = list[index].firmaUnvan;
                    Navigator.of(context).pop(FirmaModel(
                        firmaUnvan: list[index].firmaUnvan,
                        siraNo: list[index].siraNo));
                  },
                  child: Text(
                    list[index].firmaUnvan,
                    style: purpleTxtStyle,
                  ),
                );
              },
            ),
          ),
        ],
      );
    },
  );
}

_buildLogo(context, double dynamicHeight, double dynamicWidth) {
  return Image(
    image: const AssetImage(Constants.LOGO),
    width: dynamicHeight * 0.3,
    height: dynamicWidth * 0.8,
  );
}
