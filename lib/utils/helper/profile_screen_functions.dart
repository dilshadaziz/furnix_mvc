import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

final class ProfileScreenFunctions {
  Future<void> _launchEmail() async {
    const String emailAddress = 'dilshadazim910@gmail.com';
    const String emailSubject = '';
    const String emailBody = '';

    final Uri emailUri = Uri.parse("mailto:$emailAddress?subject=&body=");
    // final Uri emailUri = Uri(
    //   path: 'dilshadazim910@gmail.com',
    //   scheme: 'mailto',
    //   queryParameters: {
    //     'subject': emailSubject,
    //     'body': emailBody,
    //   },
    // );

    try {
      await launcher.launchUrl(emailUri);
    } catch (e) {
      print(e);
    }
  }

  Future<void> launchEmail() async {
    debugPrint('lauched');
    await _launchEmail();
  }

  
  
  
  
  
  
  // Future<void> _launchPrivacyPolicy() async {
  //   final Uri url = Uri.parse(
  //       'https://www.app-privacy-policy.com/live.php?token=uJFo1kXdQd1aY9NJNjsbjNCuvTbYchkT');
  //   try {
  //     await launcher.launchUrl(url);
  //   } catch (e) {
  //     print('cant find the email');
  //   }
  // }
  // Future<void> launchPrivacyPolicy() async {
  //   await _launchPrivacyPolicy();
  // }
  // Future<void> _launchTermsConditions() async {
  //   final Uri url = Uri.parse(
  //       'https://www.app-privacy-policy.com/live.php?token=ve3uRD89qHFik8ihl2bdtEckKaMW3Jap');
  //   try {
  //     await launcher.launchUrl(url);
  //   } catch (e) {
  //     print('cant find the privacy policy');
  //   }
  // }
  // Future<void> launchTermsConditions() async {
  //   await _launchTermsConditions();
  // }
  // String _getGreeting() {
  //   DateTime now = DateTime.now();
  //   if (now.isAfter(DateTime(now.year, now.month, now.day, 0, 0)) &&
  //       now.isBefore(DateTime(now.year, now.month, now.day, 12, 0))) {
  //     return '🤓 Good morning';
  //   } else if (now.isAfter(DateTime(now.year, now.month, now.day, 12, 0)) &&
  //       now.isBefore(DateTime(now.year, now.month, now.day, 18, 0))) {
  //     return '😏 Good afternoon';
  //   } else if (now.isAfter(DateTime(now.year, now.month, now.day, 18, 0)) &&
  //       now.isBefore(DateTime(now.year, now.month, now.day, 20, 0))) {
  //     return '😊 Good evening';
  //   } else {
  //     return '😍 How was your day?';
  //   }
  // }
  // String getGreeting() {
  //   return _getGreeting();
  // }
}
