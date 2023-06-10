import 'package:flutter/material.dart';

// C stands for constants
class C {
  //background images
  static const logoLight = 'assets/images/logo_light.png';
  static const logoDark = 'assets/images/logo_dark.png';

  static const success = 'The task has been completed successfully.';

  // bottom bar screens
  static const List<Widget> screens = [
    Center(child: Text('Home Screen')),
    Center(child: Text('Account Screen')),
    Center(child: Text('Cart Screen')),
    Center(child: Text('More Screen'))
  ];

  static const double kAppBarHeight = 80;

  static const String amazonLogoUrl =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Amazon_icon.svg/2500px-Amazon_icon.svg.png";

  static const List<String> categoriesList = [
    "Prime",
    "Mobiles",
    "Fashion",
    "Electronics",
    "Home",
    "Fresh",
    "Appliances",
    "Books, Toys",
    "Essential"
  ];

  static const List<String> categoryLogos = [
    "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
    "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png",
    "https://m.media-amazon.com/images/I/115yueUc1aL._SX90_SY90_.png",
    "https://m.media-amazon.com/images/I/11qyfRJvEbL._SX90_SY90_.png",
    "https://m.media-amazon.com/images/I/11BIyKooluL._SX90_SY90_.png",
    "https://m.media-amazon.com/images/I/11CR97WoieL._SX90_SY90_.png",
    "https://m.media-amazon.com/images/I/01cPTp7SLWL._SX90_SY90_.png",
    "https://m.media-amazon.com/images/I/11yLyO9f9ZL._SX90_SY90_.png",
    "https://m.media-amazon.com/images/I/11M0jYc-tRL._SX90_SY90_.png",
  ];

  static const List<String> largeAds = [
    "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
    "https://m.media-amazon.com/images/I/61jmYNrfVoL._SX3000_.jpg",
    "https://m.media-amazon.com/images/I/612a5cTzBiL._SX3000_.jpg",
    "https://m.media-amazon.com/images/I/61fiSvze0eL._SX3000_.jpg",
    "https://m.media-amazon.com/images/I/61PzxXMH-0L._SX3000_.jpg",
  ];

  static const List<String> smallAds = [
    "https://m.media-amazon.com/images/I/11M5KkkmavL._SS70_.png",
    "https://m.media-amazon.com/images/I/11iTpTDy6TL._SS70_.png",
    "https://m.media-amazon.com/images/I/11dGLeeNRcL._SS70_.png",
    "https://m.media-amazon.com/images/I/11kOjZtNhnL._SS70_.png",
  ];

  static const List<String> adItemNames = [
    "Amazon Pay",
    "Recharge",
    "Rewards",
    "Pay Bills"
  ];

//Dont even attemp to scroll to the end of this manually lmao
  static const String amazonLogo =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/2560px-Amazon_logo.svg.png";
}