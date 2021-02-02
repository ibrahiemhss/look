import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:look/stores/intro/intro_store.dart';
import 'package:look/ui/main/main_screen.dart';
import 'package:look/widgets/intro_slider.dart';
import 'package:look/widgets/progress_indicator_widget.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => new _IntroScreenState();
}

// Custom config
class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();
  IntroStore _introStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _introStore = Provider.of<IntroStore>(context);
    if (!_introStore.loading) {
      _introStore.getInter();
      _introStore.getIntroData();
    }
  }

  @override
  void initState() {
    super.initState();
    /*  slides.add(
      new Slide(
        title: "الشاشه الثالثه",
        styleTitle:
        TextStyle(color: Color(0xff512DA8), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
        subTitle:"عنوان صغير الشاشه الثالثه",
        stylesubTitle:
        TextStyle(color: Color(0xff512DA8), fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),

        description:

        "الشاشه الثالثه نص تجريبي الشاشه الثالثه نص تجريبي الشاشه الثالثه نص تجريبي الشاشه الثالثه نص تجريبي الشاشه الثالثه نص تجريبي الشاشه الثالثه نص تجريبي الشاشه الثالثه نص تجريبي الشاشه الثالثه نص تجريبي الشاشه الثالثه نص تجريبي",
        styleDescription:
        TextStyle(color: Color(0xff512DA8), fontSize: 16.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
        //pathImage: "images/photo_coffee_shop.png",
        centerWidget: CachedNetworkImage(
          imageUrl: "https://i.postimg.cc/Yqh58tbv/ic-launcher-playstore.png",
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                  colorFilter:
                  ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        colorBegin: Color(0xffFFFFFF),
        colorEnd: Color(0xffE8EAF6),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 3,
      ),
    );*/
  }

  void onDonePress() {
    _introStore.setFirstInter(false);
  }

  void onSkipPress() {
    // TODO: go to next screen
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xFF21B6C9),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Text("تصفح التطبيق",
        style: TextStyle(
          color: Color(0xFF21B6C9),
        ));
    /* return Icon(
      Icons.done,
      color: Color(0xffFFFFFF),
    );*/
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xFF21B6C9),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        name: 'global-observer',
        builder: (context) {
          return !_introStore.firstEnter
              ? MainPagesScreen()
              : _introStore.loading
                  ? CustomProgressIndicatorWidget()
                  : new IntroSlider(
                      // List slides
                      slides: _introStore.slides,
                      // Skip button
                      renderSkipBtn: this.renderSkipBtn(),
                      onSkipPress: this.onSkipPress,
                      colorSkipBtn: Colors.white,
                      highlightColorSkipBtn: Color(0xff000000),

                      // Next, Done button
                      onDonePress: this.onDonePress,
                      renderNextBtn: this.renderNextBtn(),
                      renderDoneBtn: this.renderDoneBtn(),
                      colorDoneBtn: Colors.white,
                      highlightColorDoneBtn: Color(0xff000000),

                      // Dot indicator
                      colorDot: Colors.white,
                      colorActiveDot: Colors.orange,
                      sizeDot: 13.0,
                    );
        });
  }
}
