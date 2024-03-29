import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../di.dart';
import '../../../../utils/constants/colors.dart';
import '../../domain/failures.dart';
import '../../helper/value_objects/email_value_object.dart';
import '../../helper/value_objects/name_value_object.dart';
import '../../helper/value_objects/password_value_object.dart';
import '../manager/register_bloc/register_bloc.dart';
import '../widgets/CustomPopUp.dart';
import '../widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            'إنشاء حساب',
            style: TextStyle(fontSize: 18.sp, color: Color(0xff2A5579)),
          ),
          backgroundColor: Color(0xffF5F5F5)),
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(() {}, (a) {
            late final String message;
            a.fold((l) {
              if (l is InvalidEmailFailure) {
                message = 'البريد الإلكتروني غير صحيح';
              }
              if (l is EmailAlreadyInUseFailure) {
                message = 'البريد الإلكتروني مستخدم من قبل';
              }
              if (l is WeakPasswordFailure) {
                message = 'كلمة المرور ضعيفة';
              }
              ScaffoldMessenger.of(context)
                  .showSnackBar(CustomPopUp.errorSnackBar(message));
            }, (r) {
              Navigator.pop(context);
              // return null;
            });
          });
        },
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CustomTitledTextField(
                    name: 'البريد الالكتروني',
                    textField: TextFormField(
                      onChanged: (value) {
                        context
                            .read<RegisterBloc>()
                            .add(EmailChanged(email: EmailAddress(value)));
                      },
                      validator: (value) {
                        return context
                            .read<RegisterBloc>()
                            .state
                            .email
                            .value
                            .fold((l) => 'بريد الكتروني غير صحيح', (r) => null);
                      },
                      // name: 'email',
                    ),
                  ),
                  PasswordTextField(
                      onChanged: (value) {
                        context
                            .read<RegisterBloc>()
                            .add(PasswordChanged(password: Password(value!)));
                      },
                      text: 'كلمة المرور',
                      validator: (value) {
                        return context
                            .read<RegisterBloc>()
                            .state
                            .password
                            .value
                            .fold((l) => 'كلمة المرور غير صحيحة', (r) => null);
                      }),
                  CustomTitledTextField(
                    name: 'الاسم الاول',
                    textField: TextFormField(
                      onChanged: (value) {
                        context
                            .read<RegisterBloc>()
                            .add(FirstNameChanged(firstName: Name(value)));
                      },
                      validator: (value) {
                        return context
                            .read<RegisterBloc>()
                            .state
                            .firstName
                            .value
                            .fold((l) => 'الاسم يجب ان يكون 3 حروف على الاقل ',
                                (r) => null);
                      },
                      // name: 'email',
                    ),
                  ),
                  CustomTitledTextField(
                    name: 'الاسم الاخير',
                    textField: TextFormField(
                      // controller: TextEditingController(
                      //     text: context
                      //         .read<RegisterBloc>()
                      //         .state
                      //         .lastName
                      //         .getOrCrash()),
                      onChanged: (value) {
                        context
                            .read<RegisterBloc>()
                            .add(LastNameChanged(lastName: Name(value)));
                      },
                      validator: (value) {
                        return context
                            .read<RegisterBloc>()
                            .state
                            .lastName
                            .value
                            .fold((l) => 'الاسم يجب ان يكون 3 حروف على الاقل',
                                (r) => null);
                      },
                      // name: 'email',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      final isValid = formKey.currentState!.validate();
                      if (isValid) {
                        context.read<RegisterBloc>().add(RegisterSubmitted());
                      }
                    },
                    child: Text('إنشاء حساب',
                        style: TextStyle(color: Colors.white)),
                    style: TextButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        minimumSize: Size(double.infinity, 40.h)),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class RegisterBlocProvider extends StatelessWidget {
  RegisterBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (BuildContext context) {
        return sl.get<RegisterBloc>();
      },
      child: RegisterPage(),
    );
  }
}
