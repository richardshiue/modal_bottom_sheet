# Flutter Modal BottomSheet

Create awesome and powerful modal bottom sheets 

## Material Modal BottomSheet

`showMaterialModalBottomSheet` 

Improved showModalBottomSheet that support scroll and drag at the same time.

## Cupertino Modal BottomSheet

iOS 13 came with an amazing new modal navigation and now it is available to use with Flutter.

###OPTION 1. Recommended.
1. use `showCupertinoModalBottomSheet` 
2. `MaterialPageRoute` does not allow animated translation for routes that are not `MaterialPageRoute` or `CupertinoPageRoute`.
For this we created `MaterialWithModalsPageRoute` that needs to replace the route you are using now. 
Notice this route type works the same as `MaterialPageRoute` and will support custom `PageTransitionsTheme`.


###OPTION 2. 
1. Wrap previous page inside a `CupertinoScaffold`. 
2. Call `CupertinoScaffold.showCupertinoModalBottomSheet(context:context, builder: ...)`

This two methods won't work together. 

It supports native features as bouncing, blurred background, dark mode, stacking modals and inside navigation.

For stacking modals call `showCupertinoModalBottomSheet` inside a modal;
For inside navigation use a CupertinoTabScaffold or a Navigator.

Also it support flutter features as WillPopScope.

## Build other BottomSheets 

Try `showBarModalBottomSheet` for a bottomSheet with the appearance used by Facebook or Slack

Check in the example project `showAvatarModalBottomSheet` for how to create your own ModalBottomSheet

## Roadmap
[ ] Support closing by dragging fast on a modal with a scroll view.
[ ] Improve animation curves when user is not dragging.
[ ] Allow to set the initial size of the bottom sheet
[ ] Support hero animations
       