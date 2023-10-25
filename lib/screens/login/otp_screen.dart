import 'package:extem_learning/providers/login_provider.dart';
import 'package:extem_learning/theme.dart';
import 'package:extem_learning/widgets/custom_button.dart';
import 'package:extem_learning/widgets/heading_text.dart';
import 'package:extem_learning/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var authPro = LoginProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       authPro = Provider.of<LoginProvider>(context, listen: false);
      authPro.isVerified = false;
    });
  }


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
                              border:
                                  Border.all(color: Colors.white, width: 0.86)),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
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
                                        hintText: 'Enter the 6 digit code',
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
                  Consumer<LoginProvider>(
                    builder: (context, value, child) => Hero(
                      tag: "btn-10",
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomButton(
                          icon: Icon(
                            value.isVerified
                                ? Icons.check
                                : Icons.arrow_forward,
                            size: 25,
                          ),
                          height: 55,
                          label: "Submit",
                          fontSize: 20,
                          foregroundColor: Colors.white,
                          onPressed: () {
                            value.onConfirmOTP(context);
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const HeadingText(name: "Didn’t received OTP?"),
                        InkWell(
                          onTap: () {},
                          child: const HeadingText(
                            name: "Resend OTP",
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
