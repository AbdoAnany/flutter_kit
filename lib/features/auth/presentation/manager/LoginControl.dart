

import '../../../../utils/validators/validation.dart';

class LoginControl{

   String email='';
   String password='';
   String phone='';
   bool remember=false;
   bool isPasswordShow=false;

   LoginControl({this.email='', this.password='', this.remember=false, this.isPasswordShow=false});

   onChangeEmail(value){email=value;}
   onChangePassword(value){password=value;}
   onChangePhoneNumber(value){phone=value;}

   String? onValidateEmail(value)=>TValidator.validateEmail(value);
   String? onValidatePassword(value)=>TValidator.validatePassword(value);
   String? onValidatePhoneNumber(value)=>TValidator.validatePhoneNumber(value);

}


class RegisterControl{

  String email='';
  String password='';
  String confirmPassword='';
  bool remember=false;
  bool isPasswordShow=false;

  RegisterControl({this.email='', this.password='',this.confirmPassword='', this.remember=false, this.isPasswordShow=false});

  onChangeEmail(value){email=value;}
  onChangePassword(value){password=value;}
  onChangeConfirmPassword(value){confirmPassword=value;}

  String? onValidateEmail(value)=>TValidator.validateEmail(value);
  String? onValidatePassword(value)=>TValidator.validatePassword(value);
  String? onValidateConfirmPassword(value)=>TValidator.validatePassword(value);
  String? onValidatePhoneNumber(value)=>TValidator.validatePhoneNumber(value);

}