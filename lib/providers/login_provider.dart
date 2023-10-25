import 'dart:developer';

import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:extem_learning/helpers/navigation_helper.dart';
import 'package:extem_learning/screens/register/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LoginProvider extends ChangeNotifier {
  String pickedCountry = '+91';

  String pickedCountryName = 'Country';
  TextEditingController mobileController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  bool visibility = false;

  void showCountryPicker(context, from) {
    showDialog(
        context: context,
        builder: (builder) => SizedBox(
              child: CountryPickerDialog(
                searchInputDecoration:
                    const InputDecoration(hintText: 'Search...'),
                priorityList: from == 'mob'
                    ? [
                        CountryPickerUtils.getCountryByIsoCode('IN'),
                      ]
                    : [],
                itemFilter: (country) =>
                    !['AS', 'AG'].contains(country.isoCode),
                isSearchable: true,
                itemBuilder: (country) => Row(
                  children: [
                    CountryPickerUtils.getDefaultFlagImage(country),
                    const SizedBox(
                      width: 10,
                    ),
                    if (from == 'mob')
                      Flexible(child: Text(country.isoCode))
                    else
                      Flexible(child: Text(country.name)),
                    if (from == 'mob')
                      Flexible(child: Text('  +${country.phoneCode}')),
                  ],
                ),
                title: const SizedBox(
                  height: 0,
                ),
                onValuePicked: (value) {
                  log(value.phoneCode);
                  if (from == 'mob') {
                    pickedCountry = '+${value.phoneCode}';
                  } else {
                    pickedCountryName = value.name;
                  }

                  notifyListeners();
                },
              ),
            ));
  }

   bool isVerified = false;

    onConfirmOTP(context){
      isVerified = true;
      if(isVerified){
        push(context, const RegistraionScreen());
       
      }
      notifyListeners();
    }

    disbaleVerfy(){
      isVerified = false;
      notifyListeners();
    }


    XFile? file;

      pickProfileIMG()async{

         try{
           
             file  = await ImagePicker().pickImage(source: ImageSource.gallery);
             
             notifyListeners();
         }catch(e){
          print("error while picking profile image ");
         }
      }
}
