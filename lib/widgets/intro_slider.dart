import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:look/constants/assets.dart';

class IntroSlider extends StatefulWidget {
  /// An array of Slide object
  final List<Slide> slides;

  // ---------- SKIP button ----------
  /// Render your own SKIP button
  final Widget renderSkipBtn;

  /// Width of view wrapper SKIP button
  final double widthSkipBtn;

  /// Fire when press SKIP button
  final Function onSkipPress;

  /// Change SKIP to any text you want
  final String nameSkipBtn;

  /// Style for text at SKIP button
  final TextStyle styleNameSkipBtn;

  /// Color for SKIP button
  final Color colorSkipBtn;

  /// Color for Skip button when press
  final Color highlightColorSkipBtn;

  /// Show or hide SKIP button
  final bool isShowSkipBtn;

  /// Rounded SKIP button
  final double borderRadiusSkipBtn;

  // ---------- PREV button ----------
  /// Render your own PREV button
  final Widget renderPrevBtn;

  /// Width of view wrapper PREV button
  final double widthPrevBtn;

  /// Change PREV to any text you want
  final String namePrevBtn;

  /// Style for text at PREV button
  final TextStyle styleNamePrevBtn;

  /// Color for PREV button
  final Color colorPrevBtn;

  /// Color for PREV button when press
  final Color highlightColorPrevBtn;

  /// Show or hide PREV button (only visible if skip is hidden)
  final bool isShowPrevBtn;

  /// Rounded PREV button
  final double borderRadiusPrevBtn;

  // ---------- NEXT button ----------
  /// Render your own NEXT button
  final Widget renderNextBtn;

  /// Change NEXT to any text you want
  final String nameNextBtn;

  // ---------- DONE button ----------
  /// Change DONE to any text you want
  final String nameDoneBtn;

  /// Render your own DONE button
  final Widget renderDoneBtn;

  /// Width of view wrapper DONE button
  final double widthDoneBtn;

  /// Fire when press DONE button
  final Function onDonePress;

  /// Style for text at DONE button
  final TextStyle styleNameDoneBtn;

  /// Color for DONE button
  final Color colorDoneBtn;

  /// Color for DONE button when press
  final Color highlightColorDoneBtn;

  /// Rounded DONE button
  final double borderRadiusDoneBtn;

  // ---------- Dot indicator ----------
  /// Show or hide dot indicator
  final bool isShowDotIndicator;

  /// Color for dot when passive
  final Color colorDot;

  /// Color for dot when active
  final Color colorActiveDot;

  /// Size of each dot
  final double sizeDot;

  /// Show or hide status bar
  final bool shouldHideStatusBar;

  // ---------- Behavior ----------
  /// Whether or not the slider is scrollable (or controlled only by buttons)
  final bool isScrollable;

  // Constructor
  IntroSlider({
    @required this.slides,
    // Skip
    this.renderSkipBtn,
    this.widthSkipBtn,
    this.onSkipPress,
    this.nameSkipBtn,
    this.styleNameSkipBtn,
    this.colorSkipBtn,
    this.highlightColorSkipBtn,
    this.isShowSkipBtn,
    this.borderRadiusSkipBtn,

    // Prev
    this.renderPrevBtn,
    this.widthPrevBtn,
    this.namePrevBtn,
    this.isShowPrevBtn,
    this.styleNamePrevBtn,
    this.colorPrevBtn,
    this.highlightColorPrevBtn,
    this.borderRadiusPrevBtn,

    // Done
    this.renderDoneBtn,
    this.widthDoneBtn,
    this.onDonePress,
    this.nameDoneBtn,
    this.colorDoneBtn,
    this.highlightColorDoneBtn,
    this.borderRadiusDoneBtn,
    this.styleNameDoneBtn,

    // Next
    this.renderNextBtn,
    this.nameNextBtn,

    // Dots
    this.isShowDotIndicator,
    this.colorDot,
    this.colorActiveDot,
    this.sizeDot,
    this.shouldHideStatusBar,
    this.isScrollable,
  });

  @override
  IntroSliderState createState() => new IntroSliderState(
        slides: this.slides,

        // Skip
        renderSkipBtn: this.renderSkipBtn,
        widthSkipBtn: this.widthSkipBtn,
        onSkipPress: this.onSkipPress,
        nameSkipBtn: this.nameSkipBtn,
        styleNameSkipBtn: this.styleNameSkipBtn,
        colorSkipBtn: this.colorSkipBtn,
        highlightColorSkipBtn: this.highlightColorSkipBtn,
        isShowSkipBtn: this.isShowSkipBtn,
        borderRadiusSkipBtn: this.borderRadiusSkipBtn,

        // Prev
        renderPrevBtn: this.renderPrevBtn,
        widthPrevBtn: this.widthPrevBtn,
        namePrevBtn: this.namePrevBtn,
        isShowPrevBtn: this.isShowPrevBtn,
        styleNamePrevBtn: this.styleNamePrevBtn,
        colorPrevBtn: this.colorPrevBtn,
        highlightColorPrevBtn: this.highlightColorPrevBtn,
        borderRadiusPrevBtn: this.borderRadiusPrevBtn,

        // Done
        renderDoneBtn: this.renderDoneBtn,
        widthDoneBtn: this.widthDoneBtn,
        onDonePress: this.onDonePress,
        nameDoneBtn: this.nameDoneBtn,
        styleNameDoneBtn: this.styleNameDoneBtn,
        colorDoneBtn: this.colorDoneBtn,
        highlightColorDoneBtn: this.highlightColorDoneBtn,
        borderRadiusDoneBtn: this.borderRadiusDoneBtn,

        // Next
        renderNextBtn: this.renderNextBtn,
        nameNextBtn: this.nameNextBtn,

        // Dots
        isShowDotIndicator: this.isShowDotIndicator,
        colorDot: this.colorDot,
        colorActiveDot: this.colorActiveDot,
        sizeDot: this.sizeDot,
        shouldHideStatusBar: this.shouldHideStatusBar,
        isScrollable: this.isScrollable,
      );
}

class IntroSliderState extends State<IntroSlider>
    with SingleTickerProviderStateMixin {
  /// Default values
  static TextStyle defaultBtnNameTextStyle = TextStyle(color: Colors.white);

  static double defaultBtnBorderRadius = 30.0;

  static Color defaultBtnColor = Colors.transparent;

  static Color defaultBtnHighlightColor = Colors.white.withOpacity(0.3);

  /// An array of Slide object
  final List<Slide> slides;

  // ----------SKIP button----------
  /// Render your own SKIP button
  Widget renderSkipBtn;

  /// Width of view wrapper SKIP button
  double widthSkipBtn;

  /// Fire when press SKIP button
  Function onSkipPress;

  /// Change SKIP to any text you want
  String nameSkipBtn;

  /// Style for text at SKIP button
  TextStyle styleNameSkipBtn;

  /// Color for SKIP button
  Color colorSkipBtn;

  /// Color for SKIP button when press
  Color highlightColorSkipBtn;

  /// Show or hide SKIP button
  bool isShowSkipBtn;

  /// Rounded SKIP button
  double borderRadiusSkipBtn;

  // ----------PREV button----------
  /// Render your own PREV button
  Widget renderPrevBtn;

  /// Change PREV to any text you want
  String namePrevBtn;

  /// Style for text at PREV button
  TextStyle styleNamePrevBtn;

  /// Color for PREV button
  Color colorPrevBtn;

  /// Width of view wrapper PREV button
  double widthPrevBtn;

  /// Color for PREV button when press
  Color highlightColorPrevBtn;

  /// Show or hide PREV button
  bool isShowPrevBtn;

  /// Rounded PREV button
  double borderRadiusPrevBtn;

  // ----------DONE button----------
  /// Render your own DONE button
  Widget renderDoneBtn;

  /// Width of view wrapper DONE button
  double widthDoneBtn;

  /// Fire when press DONE button
  Function onDonePress;

  /// Change DONE to any text you want
  String nameDoneBtn;

  /// Style for text at DONE button
  TextStyle styleNameDoneBtn;

  /// Color for DONE button
  Color colorDoneBtn;

  /// Color for DONE button when press
  Color highlightColorDoneBtn;

  /// Rounded DONE button
  double borderRadiusDoneBtn;

  // ----------NEXT button----------
  /// Render your own NEXT button
  Widget renderNextBtn;

  /// Change NEXT to any text you want
  String nameNextBtn;

  // Dot indicator
  /// Show or hide dot indicator
  bool isShowDotIndicator = true;

  /// Color for dot when passive
  Color colorDot;

  /// Color for dot when active
  Color colorActiveDot;

  /// Size of each dot
  double sizeDot = 8.0;

  /// Show or hide status bar
  bool shouldHideStatusBar;

  /// Allow the slider to scroll
  bool isScrollable;

  // Constructor
  IntroSliderState({
    // List slides
    @required this.slides,

    // Skip button
    @required this.renderSkipBtn,
    @required this.widthSkipBtn,
    @required this.onSkipPress,
    @required this.nameSkipBtn,
    @required this.styleNameSkipBtn,
    @required this.colorSkipBtn,
    @required this.highlightColorSkipBtn,
    @required this.isShowSkipBtn,
    @required this.borderRadiusSkipBtn,

    // Prev button
    @required this.widthPrevBtn,
    @required this.isShowPrevBtn,
    @required this.namePrevBtn,
    @required this.renderPrevBtn,
    @required this.styleNamePrevBtn,
    @required this.colorPrevBtn,
    @required this.highlightColorPrevBtn,
    @required this.borderRadiusPrevBtn,

    // Done button
    @required this.renderDoneBtn,
    @required this.widthDoneBtn,
    @required this.onDonePress,
    @required this.nameDoneBtn,
    @required this.styleNameDoneBtn,
    @required this.colorDoneBtn,
    @required this.highlightColorDoneBtn,
    @required this.borderRadiusDoneBtn,

    // Next button
    @required this.nameNextBtn,
    @required this.renderNextBtn,

    // Dot indicator
    @required this.isShowDotIndicator,
    @required this.colorDot,
    @required this.colorActiveDot,
    @required this.sizeDot,
    @required this.shouldHideStatusBar,

    // Behavior
    @required this.isScrollable,
  });

  TabController tabController;

  List<Widget> tabs = new List();
  List<Widget> dots = new List();

  @override
  void initState() {
    super.initState();

    tabController = new TabController(length: slides.length, vsync: this);
    tabController.addListener(() {
      // To change dot color
      this.setState(() {});
    });

    setupButtonDefaultValues();

    // Dot indicator
    if (isShowDotIndicator == null) {
      isShowDotIndicator = true;
    }
    if (colorDot == null) {
      colorDot = Color(0x80000000);
    }
    if (colorActiveDot == null) {
      colorActiveDot = Color(0xffffffff);
    }
    if (sizeDot == null) {
      sizeDot = 8.0;
    }

    if (isScrollable == null) {
      isScrollable = true;
    }

    renderListTabs();
  }

  void setupButtonDefaultValues() {
    // Skip button
    if (onSkipPress == null) {
      onSkipPress = () {
        tabController.animateTo(slides.length - 1);
      };
    }
    if (isShowSkipBtn == null) {
      isShowSkipBtn = true;
    }
    if (styleNameSkipBtn == null) {
      styleNameSkipBtn = defaultBtnNameTextStyle;
    }
    if (nameSkipBtn == null) {
      nameSkipBtn = "SKIP";
    }
    if (renderSkipBtn == null) {
      renderSkipBtn = Text(
        nameSkipBtn,
        style: styleNameSkipBtn,
      );
    }
    if (colorSkipBtn == null) {
      colorSkipBtn = defaultBtnColor;
    }
    if (highlightColorSkipBtn == null) {
      highlightColorSkipBtn = defaultBtnHighlightColor;
    }
    if (borderRadiusSkipBtn == null) {
      borderRadiusSkipBtn = defaultBtnBorderRadius;
    }

    // Prev button
    if (isShowPrevBtn == null || isShowSkipBtn) {
      isShowPrevBtn = false;
    }
    if (styleNamePrevBtn == null) {
      styleNamePrevBtn = defaultBtnNameTextStyle;
    }
    if (namePrevBtn == null) {
      namePrevBtn = "PREV";
    }
    if (renderPrevBtn == null) {
      renderPrevBtn = Text(
        namePrevBtn,
        style: styleNamePrevBtn,
      );
    }
    if (colorPrevBtn == null) {
      colorPrevBtn = defaultBtnColor;
    }
    if (highlightColorPrevBtn == null) {
      highlightColorPrevBtn = defaultBtnHighlightColor;
    }
    if (borderRadiusPrevBtn == null) {
      borderRadiusPrevBtn = defaultBtnBorderRadius;
    }

    // Done button
    if (onDonePress == null) {
      onDonePress = () {};
    }
    if (styleNameDoneBtn == null) {
      styleNameDoneBtn = defaultBtnNameTextStyle;
    }
    if (nameDoneBtn == null) {
      nameDoneBtn = "DONE";
    }
    if (renderDoneBtn == null) {
      renderDoneBtn = Text(
        nameDoneBtn,
        style: styleNameDoneBtn,
      );
    }
    if (colorDoneBtn == null) {
      colorDoneBtn = defaultBtnColor;
    }
    if (highlightColorDoneBtn == null) {
      highlightColorDoneBtn = defaultBtnHighlightColor;
    }
    if (borderRadiusDoneBtn == null) {
      borderRadiusDoneBtn = defaultBtnBorderRadius;
    }

    // Next button
    if (nameNextBtn == null) {
      nameNextBtn = "NEXT";
    }
    if (renderNextBtn == null) {
      renderNextBtn = Text(
        nameNextBtn,
        style: styleNameDoneBtn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //Full screen view
    if (shouldHideStatusBar == true) {
      SystemChrome.setEnabledSystemUIOverlays([]);
    }

    return Scaffold(
      body: DefaultTabController(
        length: slides.length,
        child: Stack(
          children: <Widget>[
            TabBarView(
              children: tabs,
              controller: tabController,
              physics: isScrollable
                  ? ScrollPhysics()
                  : NeverScrollableScrollPhysics(),
            ),
            renderBottom(),
          ],
        ),
      ),
    );
  }

  Widget buildSkipButton() {
    if (tabController.index + 1 == slides.length) {
      return Container(width: MediaQuery.of(context).size.width / 4);
    } else {
      return FlatButton(
        onPressed: onSkipPress,
        child: renderSkipBtn,
        color: colorSkipBtn,
        highlightColor: highlightColorSkipBtn,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(borderRadiusSkipBtn)),
      );
    }
  }

  Widget buildDoneButton() {
    return FlatButton(
      onPressed: onDonePress,
      child: renderDoneBtn,
      color: colorDoneBtn,
      highlightColor: highlightColorDoneBtn,
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(borderRadiusDoneBtn)),
    );
  }

  Widget buildPrevButton() {
    if (tabController.index == 0) {
      return Container(width: MediaQuery.of(context).size.width / 4);
    } else {
      return FlatButton(
        onPressed: () {
          tabController.animateTo(tabController.index - 1);
        },
        child: renderPrevBtn,
        color: colorPrevBtn,
        highlightColor: highlightColorPrevBtn,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(borderRadiusPrevBtn)),
      );
    }
  }

  Widget buildNextButton() {
    return FlatButton(
      onPressed: () {
        tabController.animateTo(tabController.index + 1);
      },
      child: renderNextBtn,
      color: colorDoneBtn,
      highlightColor: highlightColorDoneBtn,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(borderRadiusDoneBtn)),
    );
  }

  Widget renderBottom() {
    return Positioned(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Flexible(
            child: isShowDotIndicator
                ? Row(
                    children: renderListDots(),
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
                : Container(),
          ),

          // Next, Done button
          Container(
            alignment: Alignment.center,
            child: tabController.index + 1 == slides.length
                ? buildDoneButton()
                : buildNextButton(),
            width: widthDoneBtn ?? MediaQuery.of(context).size.width / 2,
          ),
        ],
      ),
      bottom: 10.0,
      left: 10.0,
      right: 10.0,
    );
  }

  List<Widget> renderListTabs() {
    for (int i = 0; i < slides.length; i++) {
      tabs.add(
        renderTab(
          slides[i].title,
          slides[i].maxLineTitle,
          slides[i].styleTitle,
          slides[i].marginTitle,
          slides[i].subTitle,
          slides[i].maxLinesubTitle,
          slides[i].stylesubTitle,
          slides[i].marginsubTitle,
          slides[i].description,
          slides[i].maxLineTextDescription,
          slides[i].styleDescription,
          slides[i].marginDescription,
          slides[i].pathImage,
          slides[i].widthImage,
          slides[i].heightImage,
          slides[i].onCenterItemPress,
          slides[i].centerWidget,
          slides[i].backgroundColor,
          slides[i].colorBegin,
          slides[i].colorEnd,
          slides[i].directionColorBegin,
          slides[i].directionColorEnd,
          slides[i].backgroundImage,
          slides[i].backgroundImageFit,
          slides[i].backgroundOpacity,
          slides[i].backgroundOpacityColor,
          slides[i].backgroundBlendMode,
        ),
      );
    }
    return tabs;
  }

  Widget renderTab(
    // Title
    String title,
    int maxLineTitle,
    TextStyle styleTitle,
    EdgeInsets marginTitle,
    String subTitle,
    int maxLinesubTitle,
    TextStyle stylesubTitle,
    EdgeInsets marginsubTitle,
    // Description
    String description,
    int maxLineTextDescription,
    TextStyle styleDescription,
    EdgeInsets marginDescription,

    // Image
    String pathImage,
    double widthImage,
    double heightImage,
    Function onCenterItemPress,

    // Center Widget
    Widget centerWidget,

    // Background color
    Color backgroundColor,
    Color colorBegin,
    Color colorEnd,
    AlignmentGeometry directionColorBegin,
    AlignmentGeometry directionColorEnd,

    // Background image
    String backgroundImage,
    BoxFit backgroundImageFit,
    double backgroundOpacity,
    Color backgroundOpacityColor,
    BlendMode backgroundBlendMode,
  ) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: backgroundImage != null
          ? BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: backgroundImageFit ?? BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  backgroundOpacityColor != null
                      ? backgroundOpacityColor
                          .withOpacity(backgroundOpacity ?? 0.5)
                      : Colors.black.withOpacity(backgroundOpacity ?? 0.5),
                  backgroundBlendMode ?? BlendMode.darken,
                ),
              ),
            )
          : BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF21B6F5), Color(0xFF21B6C9)],
                begin: directionColorBegin ?? Alignment.topLeft,
                end: directionColorEnd ?? Alignment.bottomRight,
              ),
            ),
      child: Container(
        margin: EdgeInsets.only(bottom: 60.0),
        child: ListView(
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 child: Align(
                   alignment: Alignment.centerLeft,
                   child: Container(
                   height: 96,
                   width: 96,
                     child:  SvgPicture.asset(
                           Assets.logo_svg
                       )
                 )
                 ),
               ),
             ),

            title==""||title==null?Container():Container(
              // Title
              child: Text(
                title ?? "",
                style: styleTitle ??
                    TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                maxLines: maxLineTitle != null ? maxLineTitle : 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              margin: marginTitle ??
                  EdgeInsets.only(
                      top: 8.0, bottom: 4.0, left: 4.0, right: 4.0),
            ),
            subTitle==""||subTitle==null?Container():Container(
              // subTitle
              child: Text(
                subTitle ?? "",
                style: stylesubTitle ??
                    TextStyle(
                      color: Color(0xff512DA8),
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                maxLines: maxLinesubTitle != null ? maxLinesubTitle : 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              margin: marginsubTitle ??
                  EdgeInsets.only(
                      top: 8.0, left: 4.0, right: 30.0),
            ),

            // Image or Center widget
             Container(
               height: 200,
                 width: 200,
                 child: centerWidget??Container()),

            // Description
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 4.0, right: 4.0),
                child: Text(
                  description ?? "",
                  style:
                      TextStyle(color: Colors.white, fontSize: 18.0,fontWeight: FontWeight.bold,fontFamily: 'RobotoMono'),
                  textAlign: TextAlign.center,
                  maxLines: maxLineTextDescription != null
                      ? maxLineTextDescription
                      : 100,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> renderListDots() {
    dots.clear();
    for (int i = 0; i < slides.length; i++) {
      Color currentColor;
      if (tabController.index == i) {
        currentColor = colorActiveDot;
      } else {
        currentColor = colorDot;
      }
      dots.add(renderDot(sizeDot, currentColor));
    }
    return dots;
  }

  Widget renderDot(double radius, Color color) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius / 2)),
      width: radius,
      height: radius,
      margin: EdgeInsets.all(radius / 2),
    );
  }
}

class Slide {
  // Title
  /// Change text title at top
  String title;

  /// Change max number of lines title at top
  int maxLineTitle;

  /// Style for text title
  TextStyle styleTitle;

  /// Margin for text title
  EdgeInsets marginTitle;

  String subTitle;
  int maxLinesubTitle;
  TextStyle stylesubTitle;
  EdgeInsets marginsubTitle;
  // Image
  /// Path to your local image
  String pathImage;

  /// Width of image
  double widthImage;

  /// Height of image
  double heightImage;

  /// Fire when press image
  Function onCenterItemPress;

  // Custom your center widget instead of image (if this widget exist, center image will hide)
  Widget centerWidget;

  //endregion

  // Description
  /// Change text description at bottom
  String description;

  /// Maximum line of text description
  int maxLineTextDescription;

  /// Style for text description
  TextStyle styleDescription;

  /// Margin for text description
  EdgeInsets marginDescription;

  // Background color
  /// Background tab color
  Color backgroundColor;

  /// Gradient tab color begin
  Color colorBegin;

  /// Gradient tab color end
  Color colorEnd;

  /// Direction color begin
  AlignmentGeometry directionColorBegin;

  /// Direction color end
  AlignmentGeometry directionColorEnd;

  // Background image
  String backgroundImage;
  BoxFit backgroundImageFit;
  double backgroundOpacity;
  Color backgroundOpacityColor;
  BlendMode backgroundBlendMode;

  Slide({
    // Title
    String title,
    int maxLineTitle,
    TextStyle styleTitle,
    EdgeInsets marginTitle,
    String subTitle,
    int maxLinesubTitle,
    TextStyle stylesubTitle,
    EdgeInsets marginsubTitle,
    // Image (if specified centerWidget is not displayed)
    String pathImage,
    double widthImage,
    double heightImage,
    Function onCenterItemPress,

    // Center widget
    Widget centerWidget,

    // Description
    String description,
    int maxLineTextDescription,
    TextStyle styleDescription,
    EdgeInsets marginDescription,

    // Background color
    Color backgroundColor,
    Color colorBegin,
    Color colorEnd,
    AlignmentGeometry directionColorBegin,
    AlignmentGeometry directionColorEnd,

    // Background image
    String backgroundImage,
    BoxFit backgroundImageFit,
    double backgroundOpacity,
    Color backgroundOpacityColor,
    BlendMode backgroundBlendMode,
  }) {
    // Title
    this.title = title;
    this.subTitle = subTitle;
    this.maxLineTitle = maxLineTitle;
    this.styleTitle = styleTitle;
    this.marginTitle = marginTitle;

    // Image
    this.pathImage = pathImage;
    this.widthImage = widthImage;
    this.heightImage = heightImage;
    this.onCenterItemPress = onCenterItemPress;

    // Center widget
    this.centerWidget = centerWidget;

    // Description
    this.description = description;
    this.maxLineTextDescription = maxLineTextDescription;
    this.styleDescription = styleDescription;
    this.marginDescription = marginDescription;

    // Background color
    this.backgroundColor = backgroundColor;
    this.colorBegin = colorBegin;
    this.colorEnd = colorEnd;
    this.directionColorBegin = directionColorBegin;
    this.directionColorEnd = directionColorEnd;

    // background image
    this.backgroundImage = backgroundImage;
    this.backgroundImageFit = backgroundImageFit;
    this.backgroundOpacity = backgroundOpacity;
    this.backgroundOpacityColor = backgroundOpacityColor;
    this.backgroundBlendMode = backgroundBlendMode;
  }
}