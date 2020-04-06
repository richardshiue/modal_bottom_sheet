import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../modal_bottom_sheet.dart';
import 'bottom_sheet_route.dart';

class e extends PageRouteBuilder {
  
}

class MaterialWithModalsPageRoute<T> extends MaterialPageRoute<T> {
  /// Construct a MaterialPageRoute whose contents are defined by [builder].
  ///
  /// The values of [builder], [maintainState], and [fullScreenDialog] must not
  /// be null.
  MaterialWithModalsPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  })  : assert(builder != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        assert(opaque),
        super(
            settings: settings,
            fullscreenDialog: fullscreenDialog,
            builder: builder,
            maintainState: maintainState);



  ModalBottomSheetRoute _nextModalRoute;

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) {
    // Don't perform outgoing animation if the next route is a fullscreen dialog.
    return (nextRoute is MaterialPageRoute && !nextRoute.fullscreenDialog) ||
        (nextRoute is CupertinoPageRoute && !nextRoute.fullscreenDialog) ||
        (nextRoute is MaterialWithModalsPageRoute &&
            !nextRoute.fullscreenDialog) ||
        (nextRoute is ModalBottomSheetRoute);
  }

  @override
  void didChangeNext(Route nextRoute) {
    if (nextRoute is ModalBottomSheetRoute) {
      this._nextModalRoute = nextRoute;
    }

    super.didChangeNext(nextRoute);
  }

  @override
  void didPopNext(Route nextRoute) {
    super.didPopNext(nextRoute);
  }

  @override
  bool didPop(T result) {
    _nextModalRoute = null;
    return super.didPop(result);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    if (_nextModalRoute != null) {
      if (!secondaryAnimation.isDismissed) {
        // Avoid default transition theme to animate when a new modal view is pushed
        final fakeSecondaryAnimation =
            Tween<double>(begin: 0, end: 0).animate(secondaryAnimation);

        final defaultTransition = theme.buildTransitions<T>(
            this, context, animation, fakeSecondaryAnimation, child);
        return _nextModalRoute.getPreviousRouteTransition(
            context, secondaryAnimation, defaultTransition);
      } else {
        _nextModalRoute = null;
      }
    }

    return theme.buildTransitions<T>(
        this, context, animation, secondaryAnimation, child);
  }
}
