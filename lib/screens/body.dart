import 'package:flutter/material.dart';

import '../widgets/next_page_button.dart';

import '../widgets/text_data.dart';
import '../widgets/splash_img.dart';

import '../models/dummy_data.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int pageIndex = 0;
  var _topPageController = PageController();
  var _mainPageController = PageController();

  void changePage() {
    _mainPageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _topPageController.dispose();
    _mainPageController.dispose();
    super.dispose();
  }

  _onMainScroll() {
    _topPageController.jumpTo(_mainPageController.offset);
  }

  @override
  initState() {
    super.initState();

    _topPageController = PageController(initialPage: 0, viewportFraction: 1);
    _mainPageController = PageController(initialPage: 0)
      ..addListener(_onMainScroll);
  }

  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;
    final pageWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _topPageController,
                itemBuilder: (context, index) => SplashImage(
                  imagePath: DUMMY_DATA[index].image,
                ),
                itemCount: DUMMY_DATA.length,
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        DUMMY_DATA.length,
                        (index) => dotBuilder(context, index),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.35,
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (notification) {
                          notification.disallowIndicator();
                          return true;
                        },
                        child: PageView.builder(
                          onPageChanged: (value) {
                            setState(() {
                              pageIndex = value;
                            });
                          },
                          controller: _mainPageController,
                          itemCount: DUMMY_DATA.length,
                          itemBuilder: (context, index) => TextData(
                            titlePage: DUMMY_DATA[index].title,
                            bodyPage: DUMMY_DATA[index].text,
                          ),
                        ),
                      ),
                    ),
                    pageIndex == 2
                        ? NextPageButton(
                            pageWidth: pageWidth, pageHeight: pageHeight)
                        : Padding(
                            padding:
                                EdgeInsets.fromLTRB(pageWidth * 0.7, 0, 0, 0),
                            child: IconButton(
                              onPressed: () => changePage(),
                              icon: Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              iconSize: 50,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dotBuilder(BuildContext context, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.fromLTRB(
          8, MediaQuery.of(context).size.height * 0.02, 0, 0),
      height: 15,
      width: pageIndex == index ? 45 : 15,
      decoration: BoxDecoration(
        color: pageIndex == index
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
