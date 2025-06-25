import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_app/common/styles/spacing_styles.dart';
import 'package:library_app/utilities/constants/colors.dart';
import 'package:library_app/utilities/constants/image_strings.dart';
import 'package:library_app/utilities/constants/sizes.dart';
import 'package:library_app/utilities/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:library_app/navigation_menu.dart';
import 'package:library_app/features/authentication/screens/admin_screen.dart';

class Loginscreen extends StatelessWidget {
   Loginscreen({super.key});

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();


    final RxBool hasEmailError = false.obs;
  final RxBool hasPasswordError = false.obs;
  final RxString emailErrorText = ''.obs;
  final RxString passwordErrorText = ''.obs;

  bool isValidEmail(String email){
    return email.isNotEmpty && email.contains("@");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: FspacingStyle.paddingwithAppBarHeight,
          child: Column(
            children: [

              // TITLE:
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(height: 150, image: AssetImage(Fimages.logo)),
                  Text(
                    Ftext.logintext,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: FSizes.small),
                  Text(
                    Ftext.logintext2,
                    style: Theme.of(context).textTheme.bodyMedium,
                    
                  ),
                ],
              ),

              //FORM:
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: FSizes.spacebtwnsects),
                  child: Column(
                    children: [
                      
                      //EMAIL:
                      Obx(() => TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),labelText: Ftext.email,
                          errorText: hasEmailError.value ? emailErrorText.value: null,
                          errorStyle: const TextStyle(color: Fcolors.error),
                          ),
                      )
                      ),
                      const SizedBox(height: FSizes.spacebetwnInputfields * 1.5),
                  
                      //PASSWORD:
                      Obx(() => TextFormField(
                        controller: passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),labelText: Ftext.password, suffixIcon: Icon(Iconsax.eye_slash),
                          errorText: hasPasswordError.value ? passwordErrorText.value: null,
                          errorStyle: const TextStyle(color: Fcolors.error),
                        ),
                      )),
                      const SizedBox(height: FSizes.spacebetwnInputfields * 1.5),

                      //Sign In Button:
                      SizedBox(width: double.infinity,child: ElevatedButton(
                        onPressed: (){

                          hasEmailError.value = false;
                          hasPasswordError.value = false;
                          emailErrorText.value = "";
                          passwordErrorText.value = "";

                          if(emailcontroller.text == "admin@meclibrary.com" && passwordcontroller.text == "meclibrary123"){
                            Get.offAll(()=> const AdminScreen());
                            return;
                          }

                          
                          if (emailcontroller.text.isEmpty || passwordcontroller.text.isEmpty){
                            hasEmailError.value = true;
                            emailErrorText.value = "Enter your email";
                            hasPasswordError.value = true;
                            passwordErrorText.value = "Enter your password";       
                          }
                          else if (!isValidEmail(emailcontroller.text)){
                            hasEmailError.value = true;
                            emailErrorText.value = "Enter a valid email";
                          }
                          else if(passwordcontroller.text.length < 6){
                            hasPasswordError.value = true;
                            passwordErrorText.value = "Enter a valid password";
                          }
                          else{
                            Get.offAll(()=> const Navigation());
                          }
                        }, 
                        child: Text(Ftext.signIn)
                        ),
                        ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(color: Fcolors.grey,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
