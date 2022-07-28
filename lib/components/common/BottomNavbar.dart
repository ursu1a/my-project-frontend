import 'package:flutter/material.dart';
import '../../utils/constants.dart' as Constants;

// Bottom navigation bar
class BottomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(Constants.PRIMARY_COLOR),
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        
        items: const <BottomNavigationBarItem>[        
          BottomNavigationBarItem(
              icon: Icon(Icons.content_paste_search_outlined), label: 'Home'),          
          BottomNavigationBarItem(
              icon: Icon(
                Icons.business_center_outlined,
              ),
              label: 'List'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.mail_outlined,
              ),
              label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
              ),
              label: 'Account')
        ]);
  }
}
