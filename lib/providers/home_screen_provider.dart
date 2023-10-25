import 'package:extem_learning/screens/home/tabs/home_tab.dart';
import 'package:extem_learning/screens/home/tabs/notification_tab.dart';
import 'package:extem_learning/screens/home/tabs/profile_tab.dart';
import 'package:extem_learning/screens/home/tabs/wallet_tab.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
     
       int currentIndex = 0;
   
     List tabs = const[
         HomeTab(),
         WalletTab(),
         NotificationTab(),
         ProfileTab()
     ];

     onChangeTab(index){
        
          currentIndex = index;
          notifyListeners();
     }
}