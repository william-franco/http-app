import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:http_app/routes/routes.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static final introKey = GlobalKey<IntroductionScreenState>();

  static const String title = 'Http App';
  static const String description =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.';

  static const buttonStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
  );

  static const pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    ),
    bodyTextStyle: TextStyle(color: Colors.black, fontSize: 19.0),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(Routes.bottom);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: _buildPages(context),
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip', style: buttonStyle),
      next: const Text('Next', style: buttonStyle),
      done: const Text('Done', style: buttonStyle),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: Colors.black,
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return const FlutterLogo(size: 78.0);
  }

  List<PageViewModel> _buildPages(BuildContext context) {
    return [
      PageViewModel(
        title: title,
        body: description,
        image: _buildLogo(context),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: title,
        body: description,
        image: _buildLogo(context),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: title,
        body: description,
        image: _buildLogo(context),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: title,
        body: description,
        image: _buildLogo(context),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: title,
        body: description,
        image: _buildLogo(context),
        decoration: pageDecoration,
      ),
    ];
  }
}
