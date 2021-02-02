import 'package:flutter/material.dart';
import 'package:look/constants/colors/box_decorations.dart';
import 'package:look/stores/theme/theme_store.dart';

class BasAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final ThemeStore themeStore;
  final AppBar appBar;
  final Function onPress;
  final List<Widget> actions;

  const BasAppBar(
      {Key key,
      this.scaffoldKey,
      this.themeStore,
      this.appBar,
      this.onPress,
      this.actions})
      : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      /* shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),*/
      flexibleSpace: Container(
        decoration: BoxDecorations.appBarBoxDecoration(
            isDark: themeStore.darkMode ? true : false),
      ),
      title: Text(''),
      actions: actions,
    );
  }
}
