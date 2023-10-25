import 'package:extem_learning/helpers/navigation_helper.dart';
import 'package:extem_learning/providers/login_provider.dart';
import 'package:extem_learning/screens/login/otp_screen.dart';
import 'package:extem_learning/theme.dart';
import 'package:extem_learning/widgets/custom_button.dart';
import 'package:extem_learning/widgets/heading_text.dart';
import 'package:extem_learning/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          const SvgIcon(path: "bg_k_desiign_white"),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: "ds-3d",
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Center(
                          child: Image.asset(
                        "assets/images/edu_3d_design.png",
                        height: 200,
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Hero(
                     tag: "h-ing",
                    child: Material(
                      child: HeadingText(
                        name: "Learn, Earn, & Be\n Valuable!",
                        fontsize: 30,
                        color: Colors.white,
                        align: true,
                        fontweight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Hero(
                    tag: "d-t_1",
                    child: Material(
                      child: HeadingText(
                        name: "Real education for everyone!",
                        fontsize: 15,
                        color: Colors.grey.shade400,
                        align: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Hero(
                    tag: "login-txt-ln",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Material(
                              child: HeadingText(
                                name: "Login In",
                                color: Colors.white,
                                align: true,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Hero(
                     tag: "input-10",
                    child: Consumer<LoginProvider>(
                      builder: (context, value, child) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white, width: 0.86)),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  value.showCountryPicker(context, 'mob');
                                },
                                child: Row(
                                  children: [
                                    Material(
                                      child: Text(
                                        value.pickedCountry,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                    const Icon(Icons.arrow_drop_down,
                                        color: Colors.white)
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                color: Colors.white,
                                indent: 10,
                                endIndent: 10,
                                thickness: 0.86,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Material(
                                  child: TextField(
                                    cursorColor: Colors.white,
                                    controller: value.mobileController,
                                    keyboardType: TextInputType.phone,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        labelStyle: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                        border: InputBorder.none,
                                        hintText: 'Mobile Number',
                                        hintStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        )),
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Hero(
                    tag: "btn-10",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomButton(
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 25,
                        ),
                        height: 55,
                        label: "Get OTP",
                        fontSize: 20,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          push(context,const OtpScreen());
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
          
          
                   const HeadingText(name: "New To Extem?"),
                                   const SizedBox(height: 20,),
                   const HeadingText(name: "Sign Up",fontsize: 25,),
          
          
                ],
              ),
            ),
          ),

           
        ],
      ),
    );
  }
}
