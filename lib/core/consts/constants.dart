import 'package:flutter/material.dart';

class AppConstants{
  //#region String Constants
  static const String loginApiPath="https://reqres.in/api/login";
  static const String appBarTitleText="Hoş Geldiniz";
  static const String userNameTitle="Kullanıcı Adı";
  static const String passwordTitle="Şifre";
  static const String loginButtonText="Giriş Yap";
  static const String forgotPassword="Şifremi Unuttum";
  static const String tryToRemember="Bakım aşamasında :)";
  static const String serviceErrorMessage="Servis Hatası";
  static const String failProcess="Başarısız işlem";
  static const String checkYourLoginInformations="Kullanıcı adı ve şifrenizi kontrol edin";
  static const String validUserNameMessage="Lütfen geçerli kullanıcı adını girin (eve.holt@reqres.in)";
  static const String validPasswordMessage="Lütfen geçerli şifreyi girin (cityslicka)";
  static const String userNameAreaHintText="Kullanıcı Adı";
  static const String userName="eve.holt@reqres.in";
  static const String password="cityslicka";
  static const String userList="Kullanıcı Listesi";
  static const String getList="Listeyi Getir";

  //#endregion

  //#region LottiePaths
  static const String loginLottiePath="assets/lotties/login_lottie.json";
  //#endreigon

  //#region Padding Values
  static const double padding5=5;
  static const double padding8=8;
  static const double padding10=10;
  static const double padding12=12;
  static const double padding15=15;
  static const double padding20=20;
  //#endregion

  //#region Circular Values
  static const double circular20=20;
  static const double circular25=25;
  //#endregion

  //#region Colors
  static const Color colorTransparent=Colors.transparent;
  static const Color colorGrey=Colors.grey;
  static const Color colorBlueGrey=Colors.blueGrey;
  static const Color colorRed=Colors.red;
  static const Color colorYellow=Colors.yellow;
  static const Color colorGreen=Colors.green;
  static const Color colorBlue=Colors.blue;
  //#endregion

  //#region Time Values
  static const int milliseconds5=5;
  static const int milliseconds500=500;
  static const int milliseconds1000=1000;
  //#endregion
}
