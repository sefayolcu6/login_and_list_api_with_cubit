import 'package:flutter_case/core/consts/constants.dart';

//#region Kullanıcı giriş bilgilerinin doğruluğunu teyit edip sonucunca uygulamaya giriş yapar
mixin UserLoginInformationValid{
  bool userNameController(String userName,String password ){
    if (userName==AppConstants.userName && password==AppConstants.password) {
      return true;
    } 
    else{
      return false;
    }
  }
}
//#endregion