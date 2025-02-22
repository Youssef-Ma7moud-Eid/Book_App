import 'package:book_app/Core/utilities/snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
    
      scaffoldmessenger(context: context, text: "Cantnot launch $url", color: Colors.green);
    }
  }
}


