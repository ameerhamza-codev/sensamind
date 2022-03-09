import 'package:animated_background/animated_background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mindwatch/utils/app_colors.dart';

class AppScaffold extends Scaffold {
  AppScaffold({
    Key key,
    PreferredSizeWidget appBar,
    Widget body,
    Widget scaffoldBackground,
    Widget floatingActionButton,
    FloatingActionButtonLocation floatingActionButtonLocation,
    FloatingActionButtonAnimator floatingActionButtonAnimator,
    List<Widget> persistentFooterButtons,
    Widget drawer,
    Widget endDrawer,
    Widget bottomNavigationBar,
    BottomSheet bottomSheet,
    Color backgroundColor,
    bool resizeToAvoidBottomPadding,
    bool resizeToAvoidBottomInset,
    bool primary = true,
    DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start,
    bool extendBody = false,
    bool extendBodyBehindAppBar = false,
    Color drawerScrimColor,
    double drawerEdgeDragWidth,
    bool hasBackground = false,
  })  : assert(hasBackground != null),
        super(
          key: key,
          appBar: appBar,
          body: body != null
              ? Stack(
                  children: <Widget>[
                    scaffoldBackground ?? const _AnimatedBg(),
                    body,
                  ],
                )
              : null,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          persistentFooterButtons: persistentFooterButtons,
          drawer: drawer,
          endDrawer: endDrawer,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor,
          //resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawerScrimColor: drawerScrimColor,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
        );
}

class _AnimatedBg extends StatefulWidget {
  const _AnimatedBg({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  __AnimatedBgState createState() => __AnimatedBgState();
}

class __AnimatedBgState extends State<_AnimatedBg>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      key: const ValueKey('scaffold_bg'),
      behaviour: RandomParticleBehaviour(
        options: ParticleOptions(
          spawnMaxRadius: 50,
          spawnMaxSpeed: 30,
          spawnMinSpeed: 10,
          particleCount: 25,
          baseColor: Theme.of(context).primaryColor,
        ),
      ),
      vsync: this,
      child: widget.child ?? Container(),
    );
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            AppColors.primaryColorLight,
            AppColors.appWhite,
            AppColors.appWhite,
            AppColors.appWhite,
            AppColors.primaryColorLight,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: <double>[0.0, .3, 0.5, .7, 1.0],
          tileMode: TileMode.clamp,
        ),
        // image: DecorationImage(
        //   image: AssetImage(AppAssets.bg(2)),
        //   fit: BoxFit.cover,
        // ),
      ),
    );
  }
}
