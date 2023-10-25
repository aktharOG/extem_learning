import 'package:extem_learning/helpers/navigation_helper.dart';
import 'package:extem_learning/providers/login_provider.dart';
import 'package:extem_learning/screens/register/choose_age_screen.dart';
import 'package:extem_learning/theme.dart';
import 'package:extem_learning/widgets/custom_button.dart';
import 'package:extem_learning/widgets/custom_textfield.dart';
import 'package:extem_learning/widgets/heading_text.dart';
import 'package:extem_learning/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistraionScreen extends StatefulWidget {
  const RegistraionScreen({super.key});

  @override
  State<RegistraionScreen> createState() => _RegistraionScreenState();
}

class _RegistraionScreenState extends State<RegistraionScreen> {

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      final authPro  = Provider.of<LoginProvider>(context,listen: false);
     authPro.disbaleVerfy();
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Column(children: [
                   const SizedBox(
                    height: 20,
                  ),
                  const Hero(
                    tag: "h-ing",
                    child: Material(
                      child: HeadingText(
                        name: "Getting Started!",
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
                                name: "Fill up the details",
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
                          child: CurstomTextfield(
                            label: "Your Name",
                            hint: "Your Name",
                            controller: value.nameController,
                            maxLine: 1,
                          )),
                    ),
                  ),
                 const SizedBox(height: 15,),
                  Consumer<LoginProvider>(
                    builder: (context, value, child) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CurstomTextfield(
                          label: "Your Email Address",
                          hint: "Your Email Address",
                          controller: value.nameController,
                          maxLine: 1,
                        )),
                        
                  ),
                  const SizedBox(height: 15,),
                  Consumer<LoginProvider>(
                    builder: (context, value, child) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CurstomTextfield(
                          label: "Your School Name",
                          hint: "Your School Name",
                          controller: value.nameController,
                          maxLine: 1,
                        )),
                        
                  ),
                  const SizedBox(height: 15,),
                  Consumer<LoginProvider>(
                    builder: (context, value, child) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CurstomTextfield(
                          label: "Your City",
                          hint: "Your City",
                          controller: value.nameController,
                          maxLine: 1,
                        )),
                        
                  ),
                  const SizedBox(height: 15,),
                  Consumer<LoginProvider>(
                    builder: (context, value, child) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CurstomTextfield(
                          label: "Your State",
                          hint: "Your State",
                          controller: value.nameController,
                          maxLine: 1,
                        )),
                        
                  ),
                  const SizedBox(height: 15,),
                  Hero(
                    tag: "ag-top",
                    child: Consumer<LoginProvider>(
                      builder: (context, value, child) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CurstomTextfield(
                            label: "Your Guardian’s Mobile Number",
                            hint: "Your Guardian’s Mobile Number",
                            controller: value.nameController,
                            maxLine: 1,
                          )),
                          
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                 ],),
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
                        label: "Next",
                        fontSize: 20,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          push(context, const ChooseAgeScreen());
                        },
                      ),
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
