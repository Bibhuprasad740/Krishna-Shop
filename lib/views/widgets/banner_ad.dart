import 'package:flutter/material.dart';

import '../../models/front_page_banner_model.dart';

class FrontPageBanner extends StatefulWidget {
  const FrontPageBanner({Key? key}) : super(key: key);

  @override
  FrontPageBannerState createState() => FrontPageBannerState();
}

class FrontPageBannerState extends State<FrontPageBanner> {
  bool isLoading = false;
  List<FrontPageBannerModel> banners = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future fetchData() async {
    setState(() {
      isLoading = true;
    });
    banners = [];
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.network('');
  }
}
