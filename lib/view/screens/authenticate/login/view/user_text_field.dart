// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dinamik_otomasyon/view/screens/authenticate/login/model/user_model.dart';

class UserTextField extends ConsumerStatefulWidget {
  List<UserModel> userList;
  TextEditingController userController;
  TextEditingController userCodeController;
  TextEditingController userNameController;
  String hint;
  IconData prefixIcon;
  IconData suffixIcon;
  UserTextField({
    super.key,
    required this.userList,
    required this.userController,
    required this.userCodeController,
    required this.userNameController,
    required this.hint,
    required this.prefixIcon,
    required this.suffixIcon,
  });

  @override
  ConsumerState<UserTextField> createState() => _UserTextFieldState();
}

class _UserTextFieldState extends ConsumerState<UserTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth * 0.02,
          vertical: context.dynamicHeight * 0.002),
      child: Form(
        child: Material(
            elevation: 8,
            shadowColor: Colors.black87,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            child: TextFormField(
              controller: widget.userController,
              readOnly: true,
              textAlignVertical: TextAlignVertical.bottom,
              cursorColor: Color(MyColors.bg01),
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
                hintText: widget.hint,
                focusColor: Color(MyColors.primary),
                prefixIcon: Icon(
                  widget.prefixIcon,
                  color: Color(
                    MyColors.bg01,
                  ),
                ),
                suffix: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text(
                              Constants.kullaniciSeciniz,
                              style: purpleBoldTxtStyle,
                            ),
                            children: [
                              SizedBox(
                                height: context.dynamicHeight * 0.4,
                                width: context.dynamicWidth * 0.5,
                                child: ListView.builder(
                                  itemCount: widget.userList.length,
                                  itemBuilder: (context, index) {
                                    return SimpleDialogOption(
                                      onPressed: () {
                                        setState(() {
                                          widget.userController.text = widget
                                              .userList[index].kullaniciAdi;
                                          widget.userCodeController.text =
                                              widget.userList[index].kullaniciNo
                                                  .toString();
                                          widget.userNameController.text =
                                              widget
                                                  .userList[index].kullaniciAdi;
                                        });
                                        Navigator.of(context).pop(UserModel(
                                          kullaniciNo: widget
                                              .userList[index].kullaniciNo,
                                          kullaniciKisaAdi: widget
                                              .userList[index].kullaniciKisaAdi,
                                          kullaniciUzunAdi: widget
                                              .userList[index].kullaniciUzunAdi,
                                          kullaniciAdi: widget
                                              .userList[index].kullaniciAdi,
                                        ));
                                      },
                                      child: Text(
                                        widget.userList[index].kullaniciAdi,
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
                    },
                    child: Icon(
                      widget.suffixIcon,
                      color: Color(
                        MyColors.bg01,
                      ),
                    )),
              ),
            )),
      ),
    );
  }
}
