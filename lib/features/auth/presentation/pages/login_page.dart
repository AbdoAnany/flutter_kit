import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_kit/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_kit/utils/constants/colors.dart';

import '../../../../di.dart';
import '../../../home/presentation/pages/Home.dart';
import '../../domain/failures.dart';
import '../../helper/value_objects/email_value_object.dart';
import '../../helper/value_objects/password_value_object.dart';
import '../manager/LoginControl.dart';
import '../manager/login_bloc/login_bloc.dart';
import '../widgets/CustomPopUp.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/main_button.dart';

// class LoginPage extends StatelessWidget {
//   LoginPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<LoginBloc>(
//       create: (BuildContext context) {
//         return sl.get<LoginBloc>();
//       },
//       child: LoginForm(),
//     );
//   }
// }

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffoldKey,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            // state.authFailureOrSuccessOption.fold(() {}, (a) {
            //   late final String message;
            //   a.fold((l) {
            //     if (l is InvalidEmailFailure) {
            //       message = 'البريد الإلكتروني غير صحيح';
            //     }
            //     if (l is WrongPasswordFailure) {
            //       message = 'كلمة المرور غير صحيحة';
            //     }
            //     if (l is UserNotFoundFailure) {
            //       message = 'البريد الإلكتروني غير مسجل';
            //     }
            //     if (l is UserDisabledFailure) {
            //       message = 'البريد الإلكتروني معطل';
            //     }
            //     if (l is TooManyRequestFailure) {
            //       message = 'تم تسجيل الدخول عدة مرات ';
            //     }
            //     ScaffoldMessenger.of(context).showSnackBar(CustomPopUp.errorSnackBar(message));
            //     print(l);
            //   }, (r) {
            //     Navigator.pushReplacement(
            //         context, MaterialPageRoute(builder: (c) => Home()));
            //     // return null;
            //   });
            // });
          },
          builder: (BuildContext context, LoginState state)=>Form(
            key: formKey,
            child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 32.h),
                  child: Column(
                    children: [

                      SizedBox(height: 80.h),
                      const Text('تسجيل الدخول'),
                      SizedBox(height: 20.h),
                      CustomTitledTextField(
                        name: 'البريد الالكتروني',
                        textField: TextFormField(
                          onChanged: (e)=>sl<LoginControl>().onChangeEmail(e),
                          validator: sl<LoginControl>().onValidateEmail,
                          // name: 'email',
                        ),
                      ),
                      //  SizedBox(height: 10.h),
                      PasswordTextField(
                          text: 'كلمة المرور',
                        onChanged: sl<LoginControl>().onChangeEmail,
                        validator: sl<LoginControl>().onValidatePassword,
                      ),

                      const Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text('نسيت كلمة المرور؟')),
                      // SizedBox(height: 20.h),

                      SizedBox(height: 40.h),
                      MainButton(
                        title: 'تسجيل الدخول',
                        color:  AppColor.primary,
                        onPressed: ()=> sl<LoginCubit>().login()
                        // {
                        //   final isValid = formKey.currentState!.validate();
                        //   if (isValid) {context.read<LoginBloc>().add(LoginSubmitted());
                        //   }
                        // },
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text('أو'),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      const Text('إذا لم يكن لديك حساب قم بالتسجيل'),
                      SizedBox(height: 20.h),


                      MainButton(
                        title: 'تسجيل حساب جديد',
                        color:  AppColor.light,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => RegisterPage()));
                        },
                      ),

                    ],
                  ),
                )),
          ),

        ),
      ),
    );
  }
}
