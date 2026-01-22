import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/screens/auth_all_screens/forgot_screen/controller/forgot_screen_controller.dart';
import '../../../../widgets/on_boarding_template_widget/on_boarding_template_widget.dart';

class ForgotScreenCreatePasswordScreen extends StatelessWidget {
  const ForgotScreenCreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ForgotScreenController(),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: OnboardingTemplate(
              wave1Color: Color(0xffD8BCE5),
              wave2Color: Color(0xffEADBF1),
              wave3Color: Color(0xffF2E7F6),
              child: CustomForm(

                builder:(context,formKey)=> Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Reset Password',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                      textColor: AppColors.instance.primary,
                    ),
                    10.height,
                    CommonText(
                      text:
                      'Create your new password',
                      fontSize: 18,
                      textAlign: TextAlign.start,
                      textColor: AppColors.instance.subTextColor,
                      isDescription: true,
                    ),
                    30.height,
                    CommonTextField(
                      hintText: 'New Password',
                      onChanged: (value){
                        controller.password=value;
                      },
                      validationType: ValidationType.validatePassword,
                      borderColor: Colors.white,
                    ),
                    10.height,

                    CommonTextField(
                      originalPassword: (){
                        return controller.password;
                      },
                      hintText: 'Confirm New Password',
                      validationType: ValidationType.validateConfirmPassword,
                      borderColor: Colors.white,
                    ),
                    20.height,

                    Center(child: CommonButton(titleText: 'Reset Password', onTap: () {
                      if(formKey.currentState?.validate()??false) {
                        controller.checkCreateFunction();
                      }
                    })),

                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
