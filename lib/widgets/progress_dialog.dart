import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

enum ProgressDialogType { Normal, Download }

String _dialogMessage = "Loading...";
double _progress = 0.0, _maxProgress = 100.0;

Widget _customBody;

TextAlign _textAlign = TextAlign.left;
Alignment _progressWidgetAlignment = Alignment.centerLeft;

TextDirection _direction = TextDirection.ltr;

bool _isShowing = false;
BuildContext _context, _dismissingContext;
ProgressDialogType _progressDialogType;
bool _barrierDismissible = true, _showLogs = false;

TextStyle _progressTextStyle = TextStyle(
    color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w400),
    _messageStyle = TextStyle(
        color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600);

double _dialogElevation = 8.0, _borderRadius = 8.0;
Color _backgroundColor = Colors.white.withOpacity(0.0);
Curve _insetAnimCurve = Curves.easeInOut;
EdgeInsets _dialogPadding = const EdgeInsets.all(8.0);

Widget _progressWidget = Image.asset(
  'ssets/gif/loading.gif',
  package: 'progress_dialog',
);

class ProgressDialog {
  _Body _dialog;

  ProgressDialog(BuildContext context,
      {ProgressDialogType type,
        bool isDismissible,
        bool showLogs,
        TextDirection textDirection,
        Widget customBody}) {
    _context = context;
    _progressDialogType = type ?? ProgressDialogType.Normal;
    _barrierDismissible = isDismissible ?? true;
    _showLogs = showLogs ?? false;
    _customBody = customBody ?? null;
    _direction = textDirection ?? TextDirection.ltr;
  }

  void style(
      {Widget child,
        double progress,
        double maxProgress,
        String message,
        Widget progressWidget,
        Color backgroundColor,
        TextStyle progressTextStyle,
        TextStyle messageTextStyle,
        double elevation,
        TextAlign textAlign,
        double borderRadius,
        Curve insetAnimCurve,
        EdgeInsets padding,
        Alignment progressWidgetAlignment}) {
    if (_isShowing) return;
    if (_progressDialogType == ProgressDialogType.Download) {
      _progress = progress ?? _progress;
    }

    _dialogMessage = message ?? _dialogMessage;
    _maxProgress = maxProgress ?? _maxProgress;
    _progressWidget = progressWidget ?? _progressWidget;
    _backgroundColor = backgroundColor ?? _backgroundColor;
    _messageStyle = messageTextStyle ?? _messageStyle;
    _progressTextStyle = progressTextStyle ?? _progressTextStyle;
    _dialogElevation = elevation ?? _dialogElevation;
    _borderRadius = borderRadius ?? _borderRadius;
    _insetAnimCurve = insetAnimCurve ?? _insetAnimCurve;
    _textAlign = textAlign ?? _textAlign;
    _progressWidget = child ?? _progressWidget;
    _dialogPadding = padding ?? _dialogPadding;
    _progressWidgetAlignment =
        progressWidgetAlignment ?? _progressWidgetAlignment;
  }

  void update(
      {double progress,
        double maxProgress,
        String message,
        Widget progressWidget,
        TextStyle progressTextStyle,
        TextStyle messageTextStyle}) {
    if (_progressDialogType == ProgressDialogType.Download) {
      _progress = progress ?? _progress;
    }

    _dialogMessage = message ?? _dialogMessage;
    _maxProgress = maxProgress ?? _maxProgress;
    _progressWidget = progressWidget ?? _progressWidget;
    _messageStyle = messageTextStyle ?? _messageStyle;
    _progressTextStyle = progressTextStyle ?? _progressTextStyle;

    if (_isShowing) _dialog.update();
  }

  bool isShowing() {
    return _isShowing;
  }

  Future<bool> hide() async {
    try {
      if (_isShowing) {
        _isShowing = false;
        Navigator.of(_dismissingContext).pop();
        if (_showLogs) debugPrint('ProgressDialog dismissed');
        return Future.value(true);
      } else {
        if (_showLogs) debugPrint('ProgressDialog already dismissed');
        return Future.value(false);
      }
    } catch (err) {
      debugPrint('Seems there is an issue hiding dialog');
      debugPrint(err.toString());
      return Future.value(false);
    }
  }

  Future<bool> show() async {
    try {
      if (!_isShowing) {
        _dialog = new _Body();
        showDialog<dynamic>(
          context: _context,
          barrierDismissible: _barrierDismissible,
          builder: (BuildContext context) {
            _dismissingContext = context;
            return WillPopScope(
              onWillPop: () async => _barrierDismissible,
              child: Dialog(
                  backgroundColor: _backgroundColor,
                  insetAnimationCurve: _insetAnimCurve,
                  insetAnimationDuration: Duration(milliseconds: 100),
                  elevation: _dialogElevation,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(_borderRadius))),
                  child: _dialog),
            );
          },
        );
        // Delaying the function for 200 milliseconds
        // [Default transitionDuration of DialogRoute]
        await Future.delayed(Duration(milliseconds: 200));
        if (_showLogs) debugPrint('ProgressDialog shown');
        _isShowing = true;
        return true;
      } else {
        if (_showLogs) debugPrint("ProgressDialog already shown/showing");
        return false;
      }
    } catch (err) {
      _isShowing = false;
      debugPrint('Exception while showing the dialog');
      debugPrint(err.toString());
      return false;
    }
  }
}

// ignore: must_be_immutable
class _Body extends StatefulWidget {
  _BodyState _dialog = _BodyState();

  update() {
    _dialog.update();
  }

  @override
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _BodyState extends State<_Body> {
  update() {
    setState(() {});
  }

  @override
  void dispose() {
    _isShowing = false;
    if (_showLogs) debugPrint('ProgressDialog dismissed by back button');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return   Container(
         height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/gif/loading.gif'),
              fit: BoxFit.contain,
            ), //DecorationImage
          ),
          child: Container(
              height: 100,
              width: 100,
             child:Image.asset('assets/icon/ic_launcher_round.png'),
          ),//BoxDecoration
    );
  }
}